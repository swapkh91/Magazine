class Article < ActiveRecord::Base
  attr_accessible :user_id, :body, :title
  validates :title, :body, presence: true
  has_many :comments, as: :commentable
  belongs_to :user
end
