class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found  #拯救所有 controllers
    
    private
    def not_found
        render file: Rails.root.join("public", "404.html"), 
               status: 404,   # 給瀏覽器一個 404 的狀態
               layout: false  # 給404一個獨立的 layout, 或者不要 layout
    end
end
