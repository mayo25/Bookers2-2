Rails.application.routes.draw do


  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: "homes#about"

  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :update, :index]

end