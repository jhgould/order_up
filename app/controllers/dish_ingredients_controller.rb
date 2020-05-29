class DishIngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:id])
    @ingredients = Ingredient.all
  end

end
