class AddUserIdToHeirs < ActiveRecord::Migration[6.1]
  def change
    add_column :heirs, :user_id, :integer
    add_index :heirs, :user_id
  end
end
