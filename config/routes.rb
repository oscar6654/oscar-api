Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :registered_applications
  get 'welcome/about'

  authenticated :user do
    root to: "registered_applications#index", as: :authenticated_root, via: :get
  end
  root to: 'welcome#index'
end
