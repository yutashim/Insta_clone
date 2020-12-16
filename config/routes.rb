Rails.application.routes.draw do
  resources :favorites, only:[:new, :create, :destroy]
  resources :posts
  resources :users
  resources :sessions, only:[:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
