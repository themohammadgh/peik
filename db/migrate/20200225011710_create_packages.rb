class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.float :weight
      t.string :size
      t.text :description
      t.float :est_value
      t.string :destination
      t.string :origin
      t.integer :sender_id
      t.integer :traveler_id
      t.integer :trip_id
      t.string :receiver_fullname
      t.string :receiver_phone
      t.text :reveiver_extra

      t.timestamps
    end
    add_index :packages, [:sender_id, :traveler_id]
    add_index :packages, [:trip_id, :receiver_fullname]
  end
end
