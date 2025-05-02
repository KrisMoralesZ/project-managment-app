class ApplicationController < ActionController::Base
  set_current_tenant_through_filter

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_account

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :last_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :last_name ])
  end

  private
  def set_current_account
    account = Account.find_by(subdomain: request.subdomain)
    set_current_tenant(account)
  end
end
