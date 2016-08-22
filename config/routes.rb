Rails.application.routes.draw do
  get '/games' => 'games#index'
  get '/games/new' => 'games#new'
  get '/games/:id' => 'games#show'
  get '/games/:id/edit'=> 'games#edit'
  patch '/games/:id'=> 'games#update'
  post '/games' => 'games#create'
  delete '/games/:id' => 'games#destroy'

end
