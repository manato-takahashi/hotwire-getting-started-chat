Rails.application.routes.draw do
  # get 'rooms/show'
  # get 'users/index'
  # get 'users/show'
  devise_for :users

  resources :users, :only => [:index, :show]
  resources :rooms, :only => [:create, :show]

  resources :messages, only: %i(index new create edit update destroy) do
    resource :evaluation, only: %i(update), module: :messages
  end
  root 'users#index'
end
