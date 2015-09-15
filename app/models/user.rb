class User < ActiveRecord::Base
  before_save { self.email = email.downcase } #or you could do before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i #/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i this one removed double dots in the domain name
  
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  
end