class User < ApplicationRecord
  validates :name, presence: true
  # URI::MailTo::EMAIL_REGEXP 內建email 認證格式
  validates :email, presence: true, unique: true, 
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP, message: "email格式有霧"
                    }
  validates :password, confirmation: true
end
