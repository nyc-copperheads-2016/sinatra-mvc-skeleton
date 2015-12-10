# require 'bcrypt'

class User < ActiveRecord::Base
  # include BCrypt

  has_many :posts
  has_many :comments

end


