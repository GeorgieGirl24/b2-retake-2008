Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights, only: [:show]
  get '/passengers/:id/flights/:flight_id', to: 'passenger_flights#show'


  resources :passengers, only: [:show]
end
