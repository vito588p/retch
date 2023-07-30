class User < ApplicationRecord
  before_create :encrypt_password #Create 前加密密碼
  
  validates :name, presence: true
  # URI::MailTo::EMAIL_REGEXP 內建email 認證格式
  validates :email, presence: true, unique: true, 
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP, message: "email格式有誤"
                    }
  validates :password, confirmation: true

  def self.login(email, password)
    return nil if email.empty? or password.empty?

    #當初怎麼加密，就怎麼加回去
    #password = "x#{password}y.reverse"
    password = Digest::SHA1.hexdigest(password)

    find_by email:, password:
  end

  private # 加密密碼，透過雜湊演算 SHA1
  def encrypt_password
    #pw = "x#{self.password}y".reverse
    self.password = Digest::SHA1.hexdigest(self.password) #裡面要改成 pw
  end
end
