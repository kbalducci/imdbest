class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session
  # before_action :set_new_post

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:full_name, :user_name)
  end

  # def destroy_user_session_path
  #   root_path
  # end

  # def set_new_post
  #   @new_post = Post.new
  # end

end
