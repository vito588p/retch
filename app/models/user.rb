class User < ApplicationRecord
  before_create :encrypt_password #Create 前加密密碼
  
  validates :name, presence: true
  # URI::MailTo::EMAIL_REGEXP 內建email 認證格式
  validates :email, presence: true, unique: true, 
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP, message: "email格式有霧"
                    }
  validates :password, confirmation: true

  private # 加密密碼，透過雜湊演算 SHA1
  def encrypt_password
    self.password = Digest::SHA1.hexdigest(self.password)
  end
end
