require 'sidekiq/web'
require 'sidetiq/web'

BrewformulasOrg::Application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :imports, only: :index

  resources :documentation, only: :index

  resources :formulas, only: [:index, :show], path: '' do
    member do
      get 'refresh_description'
    end
    collection do
      get 'search'
    end
  end

  root 'formulas#index'
end
