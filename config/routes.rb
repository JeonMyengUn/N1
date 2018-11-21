Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Comments
  resources :comments, only: [:create, :destroy]
  
  #like 
  post '/articles/:id/like',  to: 'likes#like_toggle', as: 'like_article'

  # devise
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  # root url
  root to: 'home#index'
  
  #article
  resources :articles
  
  # Kategorie Menu Routes
  get 'kategorie/servise'
  get 'kategorie/partner'
  get 'kategorie/servise_center'
  get 'kategorie/introductionn'

  # Profile routes
  get   '/my_profile',         to: 'profiles#show'
  get   '/new_profile',        to: 'profiles#new'
  get   '/create_profile',     to: 'profiles#new'
  post  '/create_profile',     to: 'profiles#create'
  get   '/edit_profile',       to: 'profiles#edit'
  patch '/update_profile',     to: 'profiles#update'
  get   '/update_profile',     to: 'profiles#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
