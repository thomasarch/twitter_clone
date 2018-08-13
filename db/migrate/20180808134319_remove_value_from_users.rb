class RemoveValueFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :not_following, :string
  end
end
