class ChangeStatusDefaultInProjects < ActiveRecord::Migration[7.0]
  def change
    change_column_default :projects, :status, 0
  end
end
