Rails.application.routes.draw do
  resources :room_messages
  devise_for :users
  # get 'rooms/index'
  resources :rooms
  root 'rooms#index'
end
