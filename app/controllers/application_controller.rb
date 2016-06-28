class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_user_json

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_json
    user = current_user
    if user
      result = Jbuilder.new

      result.name user.name
      result.id user.id

      result.target!
    else
      user.to_json
    end
  end

  def user_access
    redirect_to articles_path if current_user.blank?
  end
end
