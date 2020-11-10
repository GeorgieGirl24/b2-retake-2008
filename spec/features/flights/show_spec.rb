require 'rails_helper'

RSpec.describe 'Flight Show Page' do
  describe 'As a visitor' do
    before :each do
      @airline_1 = Airline.create!(name: “Frontier”)
      @airline_2 = Airline.create!(name: “Southwest”)

      flight_1 = @airline_2.flights.create!(number: 1727, date: “08/12/20”, departure_city: “Denver”, arrival_city: “Reno”, time: "9:00")
      # flight_2 = @airline_2.flights.create!(number: 347, date: “08/016/20”, departure_city: “Denver”, arrival_city: “Minneapolis”, time: '10:00')
      # flight_3 = @airline_1.flights.create!(number: 937, date: “02/03/21”, departure_city: “Denver”, arrival_city: “Montreal”, time: '15:30')
      # flight_4 = @airline_2.flights.create!(number: 12, date: “08/03/20”, departure_city: “Denver”, arrival_city: “Ft. Lauderdale”, time: '20:10')

      @joe =  @flight_1.passengers.create!(name: “Joe”, age: 7)
      @sally =  @flight_2.passengers.create!(name: “Sally”, age: 23)
      @jill =  @flight_2.passengers.create!(name: “Jill”, age: 35)
      @bernard =  @flight_3.passengers.create!(name: “Bernard”, age: 54)
      @valter =  @flight_3.passengers.create!(name: “Valter”, age: 44)
      @lester =  @flight_4.create!(name: “Lester”, age: 21)

      visit "/flights/#{@flight_1}"
    end
    it 'can see all the flights details (number, date, time, departure_city, arrival_city)' do
      expect(page).to have_content("#{@flight_1}'s Homepage")
      within "#flight-info" do
        expect(page).to have_content("Flight Number: #{@flight_1.number}")
        expect(page).to have_content("Date: #{@flight_1.date}")
        expect(page).to have_content("Time: #{@flight_1.time}")
        expect(page).to have_content("Departure City: #{@flight_1.departure_city}")
        expect(page).to have_content("Arrival City: #{@flight_1.arrival_city}")
      end
    end
  end
end
