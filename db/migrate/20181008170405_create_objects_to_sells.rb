class CreateObjectsToSells < ActiveRecord::Migration
  def change
    create_table :objects_to_sells do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
