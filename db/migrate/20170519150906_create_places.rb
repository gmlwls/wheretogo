class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :room_id
      t.integer :user_id
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
