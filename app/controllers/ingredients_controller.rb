class IngredientsController < ApplicationController
    before_action :set_ingredients, only: [:show, :edit]
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to @ingredient
  end

  def show
  end

  def edit
  end

  def update
    @ingredient = Ingredient.update(params[:id], name: params[:ingredient][:name])
    redirect_to @ingredient
  end

  private

  def set_ingredients
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
