Rails.application.routes.draw do
  get 'homes/home'
  get 'home/about' =>'homes#about'
  devise_for :users
  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#home'
end

