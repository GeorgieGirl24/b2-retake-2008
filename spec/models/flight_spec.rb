require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it { should belong_to :airline }
    it { should have_many :passenger_flights }
    it { should have_many(:passengers).through :passenger_flights }
  end

  describe 'instance methods' do
    before :each do
      @airline_1 = Airline.create!(name: 'Frontier')
      @airline_2 = Airline.create!(name: 'Southwest')

      @flight_1 = @airline_2.flights.create!(number: 1727, date: "20/11/14", departure_city: 'Denver', arrival_city: 'Reno', time: "9:00")
      @flight_2 = @airline_2.flights.create!(number: 347, date: "20/11/14", departure_city: 'Denver', arrival_city: 'Minneapolis', time: '10:00')
      @flight_3 = @airline_1.flights.create!(number: 937, date: "20/11/14", departure_city: 'Denver', arrival_city: 'Montreal', time: '15:30')
      @flight_4 = @airline_2.flights.create!(number: 12, date: "20/11/14", departure_city: 'Denver', arrival_city: 'Ft. Lauderdale', time: '20:10')

      @joe =  @flight_2.passengers.create!(name: 'Joe', age: 7)
      @sally =  @flight_2.passengers.create!(name: 'Sally', age: 23)
      @jill =  @flight_2.passengers.create!(name: 'Jill', age: 35)
      @bernard =  @flight_2.passengers.create!(name: 'Bernard', age: 54)
      @valter =  @flight_2.passengers.create!(name: 'Valter', age: 44)
      @lester =  @flight_2.passengers.create!(name: 'Lester', age: 12)
    end
    it '.airline_name' do
      airline_1 = Airline.create!(name: 'Frontier')
      flight_3 = airline_1.flights.create!(number: 937, date: "20/11/16", departure_city: 'Denver', arrival_city: 'Montreal', time: '15:30')
      expect(flight_3.airline_name).to eq(airline_1.name)
    end

    it '.number_of_minors' do
      expect(@flight_2.number_of_minors).to eq(2)
      expect(@flight_2.number_of_minors).to_not eq(4)
    end

    it '.number_of_adults' do
      expect(@flight_2.number_of_adults).to eq(4)
      expect(@flight_2.number_of_adults).to_not eq(6)
    end
  end
end
