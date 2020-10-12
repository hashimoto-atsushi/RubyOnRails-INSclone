50.times do | n |
  name = Faker::Name.first_name
  email = Faker::Internet.safe_email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
             )
end
