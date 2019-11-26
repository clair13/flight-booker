class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    booking = Booking.create(booking_params)
    if booking
      redirect_to booking
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id,passenger_attributes: [:name, :email]
  end
end
