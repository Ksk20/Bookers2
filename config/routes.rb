Rails.application.routes.draw do
  root to: 'home#top'
  get "home/about" => "home#about"
  devise_for :users
  root 'users#show'

  resources :books, only: [:create, :index, :edit, :update, :show, :destroy]

  resources :users, only: [:show, :create, :index, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
