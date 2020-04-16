class Post < ApplicationRecord
  # validates :title, :content, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end
