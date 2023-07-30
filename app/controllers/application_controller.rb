class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found  #拯救所有 controllers

  helper_method :user_sign_in?, :current_user

  private
  def user_sign_in?
    session[:player].present?
  end

  def authenticate_user!
    if not user_sign_in?
        redirect_to login_users_path, notice: "請先登入會員"
    end
  end

  def current_user
    if user_sign_in?
      @__user__ ||= user.find_by(id: session[:player])
    else
      nil
    end
  end




  def not_found
    render file: Rails.root.join("public", "404.html"), 
           status: 404,   # 給瀏覽器一個 404 的狀態
           layout: false  # 給404一個獨立的 layout, 或者不要 layout
  end
end
