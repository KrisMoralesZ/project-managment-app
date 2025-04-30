class Organizations::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    account = Account.create(
      name: params[:organization][:account_name],
      subdomain: params[:organization][:subdomain]
    )
    resource.account = account

    if resource.save
      sign_up(resource_name, resource)
      redirect_to root_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end