class Product < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  validates :images, presence: true
end
