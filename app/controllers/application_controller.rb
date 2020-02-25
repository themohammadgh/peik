class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name, :username, :DOB, :is_traveler, :phone, :bio, :ID_number, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :current_password, :username, :is_traveler, :bio, :image])
  end
end
