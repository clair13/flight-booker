class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: :departure_airport_id
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: :arrival_airport_id

  has_many :bookings
  has_many :passengers, through: :passenger_bookings

  def self.dates_list
    dates = Flight.all.order(departure_date: :asc)
    dates.map { |d| d.departure_date.strftime("%d/%m/%Y")}.uniq
  end

  
end
