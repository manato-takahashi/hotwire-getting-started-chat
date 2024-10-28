Rails.application.routes.draw do
  get 'rooms/show'
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :messages, only: %i(index new create edit update destroy) do
    resource :evaluation, only: %i(update), module: :messages
  end
  root 'messages#index'
end
