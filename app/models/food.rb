class Food < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
