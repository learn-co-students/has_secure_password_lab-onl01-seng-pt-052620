Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  
  get '/signup' => 'users#new'
  get '/welcome' => 'users#welcome'

  post '/login' => 'sessions#create'

end
