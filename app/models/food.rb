class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, class_name: 'RecipeFood', dependent: :destroy
  has_many :recipes, through: :recipe_foods
end
