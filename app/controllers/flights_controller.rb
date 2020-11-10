class FlightsController < ApplicationController
  def show
    @flight = Flight.find(params[:id])
    # binding.pry
  end
end
