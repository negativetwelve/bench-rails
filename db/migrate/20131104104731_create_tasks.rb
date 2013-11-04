class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.belongs_to :assignee
      t.belongs_to :project
      t.belongs_to :requester

      t.timestamps
    end
  end
end
