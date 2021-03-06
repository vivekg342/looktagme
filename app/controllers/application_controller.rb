class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :check_registration
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_access_control_headers

  layout :layout_by_resource

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = 'GET, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = 'x-requested-with,Content-Type, Authorization'
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private

  def check_registration
    if current_user && !current_user.valid?
      flash[:warning] = "Please finish your #{view_context.link_to "registration", edit_user_registration_url }  before continuing.".html_safe
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :first_name, :last_name, :roles => []) }
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user
      'signup'
    else
      'application'
    end
  end

end
