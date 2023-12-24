Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    get 'persons/profile'
    root 'posts#index', as: 'home'
    get 'posts/showmy', as: 'showmy'
    get 'about' => 'pages#about', as: 'about'

    resources :posts
    resources :users, only: [:show, :edit, :update]

    devise_scope :user do
      get 'reset_password', to: 'devise/passwords#new'
      post 'reset_password', to: 'devise/passwords#create'
    end
  end
end
