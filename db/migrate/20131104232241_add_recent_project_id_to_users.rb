class AddRecentProjectIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recent_project_id, :integer, references: "Project"
  end
end
