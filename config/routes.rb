Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'homes#top'
   resources :books, only: [:new, :create, :index, :show, :destroy]do
 end
 resources :users, only: [:show, :edit, :update]
end