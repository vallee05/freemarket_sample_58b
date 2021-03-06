Rails.application.routes.draw do
  root to: 'items#index'
    get 'items/new'
  resources :items do
    resources :trades, only: [:index, :new, :create]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json'}
    end
    member do
      get 'status_edit'
    end
    resources :images
  end
  resources :shipping_addresses, only: [:index, :create, :edit, :update]
  resources :payments, only: [:index, :create, :destroy]
  resources :mypages, only:[:index] do
    collection do
      get "purchase_list"
      get "selling_item_list"
    end
    member do
      get "profile"
      get "address"
      get "login_info"
      get "telephone"
      post "profile_edit"
      post "address_edit"
      post "telephone_edit"
      post "login_info_edit"
    end
  end
  resources :signup, only:[:create] do
    collection do
      get 'user_create'
      get 'user_create_profile'
      get 'user_create_telephone'
      get 'user_create_address'
      get 'user_create_payment'
      get 'user_create_finish'
    end
  end
  resources :logouts
  resources :registrations, only:[:index,:create]
  resources :sessions, only:[:index,:destroy,:create]
  devise_for :users,
  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    # sessions: 'users/sessions',
    # registrations: 'users/registrations'
  }
end
