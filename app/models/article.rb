class Article < ApplicationRecord
  acts_as_commentable
  belongs_to :user
  has_many :likes
  has_many :l_users, through: :likes, source: :user
  validates :starting_point, presence: true
  validates :destination, presence: true
end
