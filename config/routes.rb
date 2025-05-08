Rails.application.routes.draw do
  root "welcome#index"

  devise_for :organizations, controllers: {
    registrations: "organizations/registrations"
  }

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  constraints subdomain: /.+/ do
    scope module: "organizations" do
      root to: "dashboard#index", as: :organization_root

      get "dashboard", to: "dashboard#index"
      resources :users, only: [ :index, :new, :create, :destroy ]
    end
  end
end
