class CreateSnakes < ActiveRecord::Migration[5.2]
  def change
    create_table :snakes do |t|
      t.string :solid
      t.string :liquid

      t.timestamps
    end
  end
end
