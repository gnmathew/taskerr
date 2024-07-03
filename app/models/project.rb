class Project < ApplicationRecord
  belongs_to :user_id
  has_many :tasks
end
