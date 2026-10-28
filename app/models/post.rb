class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
end