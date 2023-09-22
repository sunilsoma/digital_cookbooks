class Recipe < ApplicationRecord
  
  has_many :ingredients, dependent: :destroy
  #has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true, length: { maximum: 100 }
  validates :instructions, presence: true, length: { maximum: 1000 }
  validates :cooking_time, presence: true, numericality: { greater_than: 0 }

  scope :with_ingredients, -> { includes(:ingredients) }
  scope :search_by_name, ->(name) { where('recipes.name LIKE ?', "%#{name}%") }
  scope :with_ingredient, ->(ingredient_name) {
    joins(:ingredients).where("ingredients.name LIKE ?", "%#{ingredient_name}%")
  }

end
