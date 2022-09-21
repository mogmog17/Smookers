class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_request_variant

  # ログイン後のリダイレクト先

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_users_path
    else
      posts_path
    end
  end

  # ログアウト後のリダイレクト先

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  private

  def set_request_variant
    if from_smartphone?
      request.variant = :smartphone
    end
  end

  def from_smartphone?
    request.from_android? || request.from_iphone? || request.from_ipod? || request.from_windows_phone?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
