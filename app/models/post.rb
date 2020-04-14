class Post < ApplicationRecord
  validates :title, :content, presence: true
  # mount_uploader :image
  belongs_to :user
end
