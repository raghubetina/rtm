class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :body
      t.boolean :complete

      t.timestamps
    end
  end
end
