class Task < ApplicationRecord
  acts_as_list
  belongs_to :project

  enum status: { pending: 0, active: 1, done: 2, inactive: 3 }
end
