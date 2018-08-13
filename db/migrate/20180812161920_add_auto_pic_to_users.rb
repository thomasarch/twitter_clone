class AddAutoPicToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :autopic, :string
  end
end
