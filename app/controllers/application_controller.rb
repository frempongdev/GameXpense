class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :update_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :profile_photo) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :profile_photo) }
  end

  private 
  def after_sign_in_path_for(resource)
    # Customize the redirect path based on your requirements
    # For example:
    if resource.is_a?(User)
      # Redirect to a specific path for a user
      # user_path(resource)
      games_path
    else
      # Redirect to a different path for other resources
      root_path
    end
  end
end
