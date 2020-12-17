class User < ApplicationRecord
  has_many :posts
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post

  mount_uploader :user_image, UserImageUploader

  before_validation { email.downcase! }
  has_secure_password
end
