class User < ApplicationRecord
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  mount_uploader :user_image, UserImageUploader
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true
  before_validation { email.downcase! }
  has_secure_password
end
