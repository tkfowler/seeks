Rails.application.routes.draw do
  get '/sessions/new' => 'sessions#new'

  get '/users/new' => 'users#new'

  get '/users/:id' => 'users#show'

  get '/users/:id/edit' => 'users#edit'

  get '/secrets' => 'secrets#index'

  post '/secrets/create' => 'secrets#create'

  post '/login' => 'sessions#login'

  post '/create' => 'users#create'

  post '/likes' => 'likes#create'

  put '/users/:id' => 'users#update'

  delete '/users/:id' => 'users#destroy'

  delete '/logout' => 'sessions#logout'

  delete '/secrets/:id' => 'secrets#destroy'

  delete '/likes/:id' => 'likes#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
