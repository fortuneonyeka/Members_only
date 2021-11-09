class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authorize
    redirect_to sign_in_path, alert: 'Not authorized' if current_user.nil?
  end

  def authenticated_user?
    user_signed_in?
  end

  helper_method :authenticated_user?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[username password])
  end
end
