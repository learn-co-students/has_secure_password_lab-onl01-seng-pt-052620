Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/' => 'users#new', as: 'user'
post '/' => 'users#create'

get '/login' , to: 'sessions#new'
post '/login', to:'sessions#create'

get '/:user', to: 'users#show', as: 'homepage'
end
