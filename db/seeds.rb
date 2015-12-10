require 'faker'
5.times do
user = User.create!(
    username: Faker::Internet.user_name,
    password: Faker::Internet.password(8),
    email: Faker::Internet.safe_email
    )
  Post.create!(
    title: Faker::Book.title,
    body: Faker::Hacker.say_something_smart,
    user: user
    )
end

