class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.integer :flight_number
      t.datetime :departure_date
      t.datetime :arrival_date

      t.timestamps
    end
  end
end
