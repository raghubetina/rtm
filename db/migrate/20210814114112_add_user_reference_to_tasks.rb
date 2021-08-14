class AddUserReferenceToTasks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tasks, :users
    add_index :tasks, :user_id
    change_column_null :tasks, :user_id, false
  end
end
