class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about] #6debug:追加 (expect~)
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    user_path(resource) #10.debug:root_pathをuser_path()に書き換え
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
