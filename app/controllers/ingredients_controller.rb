class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @users = @ingredient.users
    @recipes = @ingredient.recipes
  end

  def index
    @ingredients = Ingredient.all.sort_by { |ing| (-1)*ing.users.uniq.count }
  end
end
