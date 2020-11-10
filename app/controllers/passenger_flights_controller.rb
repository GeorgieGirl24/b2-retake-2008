class PassengerFlightsController < ApplicationController
  def show
    flight = Flight.find(params[:flight_id])
# binding.pry
    redirect_to "/flights/#{flight.id}"
  end
end
