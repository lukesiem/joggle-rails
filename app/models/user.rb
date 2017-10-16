class User < ActiveRecord::Base
	  has_secure_password

	  has_many :reviews

      validates :email, uniqueness: { case_sensitive: false}
      validates :first_name, presence: true
      validates :last_name, presence: true
      validates :email, presence: true
      validates :password, presence: true, length: {minimum: 6}
      validates :password_confirmation, presence: true



    def self.authenticate_with_credentials(email, password)
    new_email = email.downcase
    user = User.find_by_email(new_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
