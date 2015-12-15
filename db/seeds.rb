require 'faker'

password = Faker::Internet.password(6)

u = User.create(
  username: eunice,
  # email: Faker::Internet.email,
  password: password,
  password_confirmation: password
)
