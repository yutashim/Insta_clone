Rails.application.routes.draw do
  resources :favorites, only:[:show, :create, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :users
  get 'users/:id/favorite', to: 'users#favorite'
  resources :sessions, only:[:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
