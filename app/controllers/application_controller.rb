class ApplicationController < ActionController::Base

	 before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def after_sign_out_path_for(reosuce)
    flash[:notice] = 'Signed out successfully.'
    root_path
  end

  def after_sign_in_path_for(reosuce)
    flash[:notice] = 'Welcome! You have sign in successfully.'
  	user_path(resource)
  end

  def after_sign_up_path_for(reosuce)
    flash[:notice] = 'Welcome! You have signed up successfully.'
    user_path(resource)
  end

end