class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :travel_from
      t.date :travel_from_local_date
      t.string :travel_to
      t.date :travel_to_local_date
      t.boolean :return, default: false
      t.string :retrun_from
      t.date :return_from_local_date
      t.string :return_to
      t.date :retrun_to_local_time
      t.string :travel_size
      t.string :return_size
      t.integer :sender_id
      t.integer :traveler_id

      t.timestamps
    end
  end
end
