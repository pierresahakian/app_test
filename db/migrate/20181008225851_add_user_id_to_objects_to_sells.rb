class AddUserIdToObjectsToSells < ActiveRecord::Migration
  def change
    add_column :objects_to_sells, :user_id, :integer
  end
end
