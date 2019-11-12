class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @airports = Airport.all.map { |airport| [airport.abbreviation, airport.name]}
    @dates = Flight.dates_list
    @passenger_selection = [1,2,3,4]
    @departure = params[:departure_airport_id]
    @arrival = params[:arrival_airport_id]
    @departure_date = params[:departure_date]
    @passengers = params[:passengers]

    @flights = Flight.search(params[:departure_airport_id], params[:arrival_airport_id], params[:departure_date])

    if params[:submit] == "Search"
      if @departure == @arrival
        flash[:danger] = "You cannot select the same departure and arrival airports,please select different airport"
      end
    end
  end
end
