class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def destroy
    @user = User.find(params[:id])
    @user.recipes.each do |recipe|
      recipe.user = nil
    end
    @user.user_ingredients.each do |ui|
      ui.destroy
    end
    @user.destroy
    redirect_to recipes_path
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private


  def user_params
    params.require(:user).permit(:name,ingredient_ids:[])
  end

end
