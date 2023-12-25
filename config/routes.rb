Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    get 'persons/profile'
    root 'posts#index', as: 'home'
    get 'posts/showmy', as: 'showmy'
    get 'about' => 'pages#about', as: 'about'
    get 'allusers' => 'pages#allusers', as: 'allusers'
    get 'pages/allusers', as: 'page_all_users'

    resources :posts
    resources :comments
    resources :users, only: [:show, :edit, :update, :create]
    resources :users do
      member do
        put 'toggle_active'
      end
    end
    devise_scope :user do
      get 'reset_password', to: 'devise/passwords#new'
      post 'reset_password', to: 'devise/passwords#create'
    end
  end
end
