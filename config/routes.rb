Rails.application.routes.draw do
  get 'carts/show'
  get 'cart_items/new'
  resources :products
  root 'products#index'
  get 'top/main'
  resources :cart_items, only: [:new, :create, :destroy]
  resources :carts, only: [:show]
  #root 'carts#show'
end
