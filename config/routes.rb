Rails.application.routes.draw do
  get 'dashboards/index', as: :dashboards
  resources :registrations , only: [:new, :create]
  resources :logins , only: [:new, :create]
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
