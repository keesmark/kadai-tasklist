class AddUserIdToTasklist < ActiveRecord::Migration[5.0]
  def change
    add_column :tasklists, :user_id, :string
    add_column :tasklists, :integer, :string
  end
end
