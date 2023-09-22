class Ingredient < ApplicationRecord
  
  belongs_to :recipe
  # has_many :recipe_ingredients
  # has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, length: { maximum: 100 }

end
