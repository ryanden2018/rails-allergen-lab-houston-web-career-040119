class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @users = @ingredient.users
    @recipes = @ingredient.recipes
  end

  def index
    @ingredients = Ingredient.all.sort_by { |ing| (-1)*ing.users.uniq.count }
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.assign_attributes(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to @ingredient
    else
      flash[:errors] = @ingredient.errors.full_messages
      redirect_to edit_ingredient_path(@ingredient)
    end
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to @ingredient
    else
      flash[:errors] = @ingredient.errors.full_messages
      redirect_to new_ingredient_path
    end
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
