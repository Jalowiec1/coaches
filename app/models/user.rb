class User < ActiveRecord::Base
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    has_secure_password
    validates :password,    presense: true, 
                            lenght: { minimum: 6 }
    validates :email,   presense: true, 
                        lenght: { maximum: 50 },
                        format: { with: VALID_EMAIL_REGEX }
    validated :name, presense: true, lenght: { maximum: 30 }
end
