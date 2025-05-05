Rails.application.routes.draw do
  devise_for :organizations, controllers: {
    registrations: "organizations/registrations"
  }

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  constraints subdomain: /.+/ do
    scope module: "organizations" do
      root to: "dashboard#index", as: :organization_root

      resources :users, only: [:index, :new, :create, :destroy] # admin gestiona usuarios
    end
  end

  root "welcome#index"

  get "up", to: "rails/health#show", as: :rails_health_check
end
