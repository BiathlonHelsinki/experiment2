Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations", omniauth_callbacks: 'omniauth_callbacks' } do
    get "logout", to: "devise/sessions#destroy"
  end

  namespace :admin do
    root to: 'base#home'
    resources :posts
    resources :pages
    resources :meetings
  end

  resources :comments do
    resources :comments
  end

  resources :meetings do
    resources :comments
    member do
      post :rsvp
      post :cancel_rsvp
    end
    resources :users do
      resources :notifications
    end
  end

  resources :pages
  
  resources :posts do
    resources :comments
    resources :users do
      resources :notifications
    end
  end
  resources :users do
    collection do
      get :mentions
    end
  end

  match '/users/auth/:provider/callback' => 'authentications#create', :via => :get
  delete '/users/signout' => 'devise/sessions#destroy', :as => :signout
  root to: 'home#index'
end
