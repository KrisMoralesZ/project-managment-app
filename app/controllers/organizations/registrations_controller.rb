class Organizations::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  def create
    build_resource(sign_up_params)

    organization = Organization.create(
      organization_name: params[:organization][:organization_name],
      subdomain: params[:organization][:subdomain]
    )

    if organization.save
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    else
      flash[:error] = "There was an error creating your organization"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :organization_name, :subdomain ])
  end
end
