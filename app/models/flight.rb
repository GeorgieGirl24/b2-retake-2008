class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  def airline_name
    self.airline.name
  end

  def number_of_adults
    self.passengers.where('age >= 18').count
  end

  def number_of_minors
    self.passengers.where('age < 18').count
  end
end
