Magazine::Application.routes.draw do
  get "sessions/create"

  get "sessions/destroy"

  root :to => 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
end
