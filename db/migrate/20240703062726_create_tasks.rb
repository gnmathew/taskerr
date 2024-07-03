class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.integer :importance
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
