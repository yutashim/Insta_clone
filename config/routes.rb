Rails.application.routes.draw do
  resources :favorites, only:[:show, :create, :destroy]
  root to: 'posts#home'
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :users
  get 'users/:id/favorite', to: 'users#favorite'
  resources :sessions, only:[:new, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
