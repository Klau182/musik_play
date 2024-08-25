Rails.application.routes.draw do
  resources :playlists
  resources :songs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :playlist, only: :show do 
    resources :songs, only: [:new, :create]
  end
  # Defines the root path route ("/")
   root "playlists#index"
end
