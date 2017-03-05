class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if params[:recipe][:ingredient_ids]
      @recipe.assign_ingredients(params[:recipe][:ingredient_ids])
    end
  end

  def show
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    @recipe.update(recipe_params)
    if params[:recipe][:ingredient_ids]
      @recipe.assign_ingredients(params[:recipe][:ingredient_ids])
    else
      @recipe.ingredients = []
    end
    redirect_to @recipe
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids)
  end
end
