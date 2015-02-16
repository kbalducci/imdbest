# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
15.times do
  user = User.create!(
    full_name: Faker::Name.name,
    user_name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8))
  3.times do
    user.posts.create!(
      movie_title: Faker::App.name,
      url: "https://www.youtube.com/watch?v=6vngB182CBQ",
      descrition: Faker::Lorem.paragraph,
      poster_image: Faker::Avatar.image)
  end
end
