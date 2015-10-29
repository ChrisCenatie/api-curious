Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get '/auth/github', as: :login
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users, only: [:show]
end
