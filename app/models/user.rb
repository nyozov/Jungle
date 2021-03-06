class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  validates :password, length: { minimum: 3 }


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      
      user
    else
     
      nil
    end
    
  end


  
end
