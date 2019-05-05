class UsersController < ApplicationController

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

end
