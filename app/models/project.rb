class Project < ApplicationRecord
  acts_as_list
  belongs_to :user
  has_many :tasks

  enum status: { pending: 0, active: 1, done: 2, inactive: 3 }
end
