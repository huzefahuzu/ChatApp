class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?


   # This after function is used for redirecting of a page after successfull sign in .
   # It redirects it to the users show page if successfully signed in.

    def after_sign_in_path_for(resource)
   		
   		users_path
	end

   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
