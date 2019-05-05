class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.sort_by { |recipe| (-1)*recipe.ingredients.count }
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @user = @recipe.user
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to @recipe
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to new_recipe_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to @recipe
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to edit_recipe_path(@recipe)
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name,:user_id,ingredient_ids:[])
  end

end
