Rails.application.routes.draw do
  resources :settings
  resources :solutions
  get 'users/Index'

  resources :users, only: [:index, :edit, :update]
  devise_for :admins
  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
