class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  validates :user_id, presence: true
  validates :title, length: { minimum: 40 }
  validates :description, length: { minimum: 150 }
  validates :title, :description, presence: true
end
