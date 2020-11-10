class PassengerFlightsController < ApplicationController
    def new
      @passenger = Passenger.find(params[:id])
    end

    def create
      airline = Airline.all.first
      passenger = Passenger.find(params[:id])
      # binding.pry
      passenger.flights.create({
        number: params[:number],
        date: params[:date],
        departure_city: params[:departure_city],
        arrival_city: params[:arrival_city],
        time: params[:time],
        airline_id: airline.id
        })
      # binding.pry
      redirect_to "/passengers/#{passenger.id}"
    end

    private
    def flight_params
      params.permit(:number, :date, :departure_city, :arrival_city, :time)
    end
end
