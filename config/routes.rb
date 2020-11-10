Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights, only: [:show]
  get '/passengers/:id/flights/new', to: 'passenger_flights#new'
  post '/passengers/:id/flights/:flight_id', to: 'passenger_flights#create'

  resources :passengers, only: [:show]
end
