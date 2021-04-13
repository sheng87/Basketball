class User < ApplicationRecord
  attr_writer :user

  validates :email, presence: true, uniqueness: true
                    ,format: { with: /.+\@.+\../,
                    message: "only allows letters" }
  validates :password, presence: true,
                       confirmation: true 


  before_create :encrypted_password

  def self.login(params)
    email = params[:email]
    password = params[:password]

    salted_pwd = salted(password)
    encrypted_password = encrypt(salted_pwd)

  end

                       
  private

  def encrypted_password 
    self.password = 
  end

  def encrypt(password)
    Digest::SHA-1.hexdigest(password)
  end

  def salted(password)
    "123#{self.password}xx"
  end  

end
