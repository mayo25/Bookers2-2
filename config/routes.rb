Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
   resources :boos, only: [:new, :create, :index, :show, :destroy]
end
