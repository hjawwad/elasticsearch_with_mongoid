Rails.application.routes.draw do
  root 'listings#index'
  resources :listings
  get 'search', to: 'search#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
