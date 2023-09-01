class User < ApplicationRecord
  has_one_attached :profile_picture, dependent: :destroy
  validates :profile_picture, presence: true
end
