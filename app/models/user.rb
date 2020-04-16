class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  mount_uploader :image
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
end
