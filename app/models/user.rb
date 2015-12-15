require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :username, presence: true
  validates :username, length: { minimum: 2 }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
