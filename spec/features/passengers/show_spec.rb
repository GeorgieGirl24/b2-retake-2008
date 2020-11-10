require 'rails_helper'

RSpec.describe 'Passengers Show Page' do
  describe 'As a visitor' do
    before :each do
      @airline_1 = Airline.create!(name: 'Frontier')
      @airline_2 = Airline.create!(name: 'Southwest')

      @flight_1 = @airline_2.flights.create!(number: 1727, date: "20/11/14", departure_city: 'Denver', arrival_city: 'Reno', time: "9:00")
      @flight_2 = @airline_2.flights.create!(number: 347, date: "20/11/15", departure_city: 'Denver', arrival_city: 'Minneapolis', time: '10:00')
      @flight_3 = @airline_1.flights.create!(number: 937, date: "20/11/16", departure_city: 'Denver', arrival_city: 'Montreal', time: '15:30')
      @flight_4 = @airline_2.flights.create!(number: 12, date: "20/11/17", departure_city: 'Denver', arrival_city: 'Ft. Lauderdale', time: '20:10')

      @valter =  @flight_3.passengers.create!(name: 'Valter', age: 44)
      @valter.flights << [@flight_1, @flight_2]
      @lester =  @flight_4.passengers.create!(name: 'Lester', age: 21)

      visit "/passengers/#{@valter.id}"
    end
    it 'can see the passengers name and a link to all the flights that that passenger has' do
      expect(page).to have_content("#{@valter.name}'s Homepage")

      within "#flights" do
        expect(page).to have_link(@flight_3.number)
        expect(page).to have_link(@flight_1.number)
        expect(page).to have_link(@flight_2.number)
      end
    end

    it 'can see that the flight numbers are links to their own flight show page' do
      within "#flights" do
        expect(page).to have_link(@flight_2.number)
        click_link(@flight_2.number)
      end
      expect(current_path).to eq("/flights/#{@flight_2.id}")
      expect(page).to have_content(@flight_2.number)
    end

    it 'can see a form with a flight number needed, that will take me to the passengers show page with the added flight' do

      within "#add-flight" do
        # fill_in 'Flight Number', with: @flight_4
        click_button 'Add Flight'
      end

      new_flight = Flight.last

      expect(current_path).to eq("/passengers/#{@valter.id}")
      within "#flights" do
        expect(page).to have_content(new_flight.number)
      end
    end
  end
end
