CookBook::Application.routes.draw do
  resources :books, :recipes, :ingredients, :users, :sessions, :comments

  get '/signup' => 'users#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  get'/signin' => 'sessions#new'

  root to: 'books#index'

  get '/data.json' => 'stats#data'
  get '/stats' => 'stats#stats'
  get '/comments/:book_id' => 'comments#new'
  get '/forgotpassword' => 'users#forgotpassword'
  post '/password_reset' => 'users#password_reset'
  get '/resetpassword/:remember_token' => 'users#reset'

end

