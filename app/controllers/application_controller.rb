class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    view_context.current_user
  end

  def logged_in?
    view_context.logged_in
  end

end
