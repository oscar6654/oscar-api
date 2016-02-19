Rails.application.routes.draw do
#   devise_for :users
#   get 'welcome/index'
#   resources :registered_applications
#   get 'welcome/about'
# # #1
#   namespace :api, defaults: { format: :json } do
# # #2
#     match '/events', to: 'events#index', via: [:options]
#     resources :events, only: [:create]
#   end


#   authenticated :user do
#     root to: "registered_applications#index", as: :authenticated_root, via: :get
#   end
#   root to: 'welcome#index'

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  root to: 'welcome#index'

  resources :users, only: [:update]
  resources :registered_applications
  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#create', via: [:options]
    resources :events, only: [:create]
  end
end
