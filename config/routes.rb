Rails.application.routes.draw do
  root "welcome#index"

  devise_for :organizations, controllers: {
    registrations: "organizations/registrations"
  }

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :users, only: [:index, :new, :create, :destroy]

  constraints subdomain: /.+/ do
    scope module: "organizations" do
      root to: "dashboard#index", as: :organization_root
    end
  end

  get "dashboard" => "dashboard#index"

end
