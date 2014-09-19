class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :description, length: { minimum:  50 }
  validates :description, :question_id, presence: true
end
