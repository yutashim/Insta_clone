30.times do
  name = Faker::TvShows::Simpsons.character
  email = Faker::Internet.unique.email
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
end
