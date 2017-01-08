 Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'users/:id/following' => 'users#followings', as: 'show_followings_user'
  get    'users/:id/followers' => 'users#followers', as: 'show_followers_user'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

 resources :users
 resources :sessions, only: [:new, :create, :destroy]
 resources :microposts
 resources :relationships, only: [:create, :destroy]
 

end

