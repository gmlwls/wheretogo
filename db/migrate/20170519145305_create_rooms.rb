class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :creator
      t.integer :member

      t.timestamps null: false
    end
  end
end
