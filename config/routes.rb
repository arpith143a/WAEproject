Rails.application.routes.draw do
  # Google Anonymous Sessions
  # https://stackoverflow.com/questions/4361994/create-named-routes-for-omniauth-in-rails-3
  get 'auth/:provider/callback', to: 'anonymous_sessions#create', as: :oauth_callback
  # get 'auth/:provider', as: :oauth
  get 'auth/failure', to: redirect('/')
  resources :anonymous_sessions, only: [:create]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # https://github.com/plataformatec/devise/wiki/How-To:-Change-Default-Sign_up---Registration-Path-with-Custom-Path
  # devise_for :users,
  #           :controllers => {:registrations => "users/registrations", omniauth_callbacks: "users/omniauth_callbacks"}

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  get 'site/home'

  get 'site/search'
  get 'site/show'
  get 'site/main'
  get 'site/profile'



  get 'items/show',to: 'items#show' ,as: 'items_show'

 # https://stackoverflow.com/questions/14416234/devise-redirect-automatically-from-root-url-if-signed-in
  authenticated :user do
    get 'site/main',to: 'user#main' , as: 'main'
    get 'site/profile',to: 'site#profile' , as: 'profile'
    # get 'users/:id/user_posts' => 'users#user_posts', :as => :custom_user_posts
    get 'site/postuser.:user_id' ,to: 'site#postuser', as: 'postuser'

    get 'site/edit_profile' ,to: 'site#edit_profile', as: 'edit_profile'
    patch 'site/update_profile' ,to: 'site#update_profile', as: 'update_profile'



    get 'site/show',to: 'site#show' , as: 'show'
    post 'site/main'


    get 'categories/:id', to: 'categories#show',as: 'categories'


    post 'site/search'
    root to: "site#main"
  end
  root to: 'site#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ----------------  RESTful STYLE ROUTING  -----------
  # resources :items
  # resources :categories, param: :name do
  #   resources :items do
  #     resources :comments
  #   end
  # end

  resources :items do
    resources :comments
  end

  # https://stackoverflow.com/questions/5246767/sti-one-controller
  resources :bid_items, :controller => :items, :type => "BidItem"  do
    resources :comments
  end
  #
  resources :non_bid_items, :controller => :items, :type => "NonBidItem"  do
    resources :comments
  end

end
