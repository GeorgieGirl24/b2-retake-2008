require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it { should belong_to :airline }
    it { should have_many :passenger_flights }
    it { should have_many(:passengers).through :passenger_flights }
  end

  describe 'instance methods' do
    it '.airline_name' do
      airline_1 = Airline.create!(name: 'Frontier')
      flight_3 = airline_1.flights.create!(number: 937, date: "20/11/16", departure_city: 'Denver', arrival_city: 'Montreal', time: '15:30')
      expect(flight_3.airline_name).to eq(airline_1.name)
    end
  end
end
