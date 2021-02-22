Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  post '/ride_mechanics/:mechanic_id', to: 'ride_mechanics#new'
end
