class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :password_confirmation

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password_confirmation, length: { minimum: 8 }
  validates_confirmation_of :password,:confirm => :password_confirmation


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
