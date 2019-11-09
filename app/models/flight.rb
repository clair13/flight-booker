class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: :departure_airport_id
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: :arrival_airport_id

  has_many :bookings
  has_many :passenger_bookings, through: :bookings
  has_many :passengers, through: :passenger_bookings

  def self.dates_list
    dates = Flight.all.order(departure_date: :asc)
    dates.map { |d| d.departure_date.strftime("%d/%m/%Y")}.uniq
  end

  def self.search(dep,arr,date)
    Flight.where(departure_airport_id: dep, arrival_airport_id: arr, departure_date: Flight.adjusted_date(date))
  end

  def self.adjusted_date(date)
    unless  date.nil?
      date = date.to_date
      date.beginning_of_day..date.end_of_day
    end
  end
end
