class CreateHeirs < ActiveRecord::Migration[6.1]
  def change
    create_table :heirs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :facebook

      t.timestamps
    end
  end
end