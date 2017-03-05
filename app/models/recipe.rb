class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  def assign_ingredients(ingredients)
    ingredients.each do |ingredient|
      self.ingredients << Ingredient.find(ingredient)
    end
  end
end
