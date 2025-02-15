class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :cpf, :phone, :address, :avatar])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :cpf, :phone, :address, :avatar])
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      my_pets_path
    else
      admin_root_path
    end
  end
end
