class PassengerFlightsController < ApplicationController
  def new
    @passenger = Passenger.find(params[:id]
  end

  def create
    passenger = Passenger.find(params[:id])
    passenger_flights = PassengerFlights.find_by(passenger)
    binding.pry
    redirect_to "/passengers/#{passenger.id}"
  end
end
