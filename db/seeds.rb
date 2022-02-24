# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Booking.destroy_all
Valentin.destroy_all
User.destroy_all

puts 'Creating seeds...'

user1 = User.create!(
  first_name: "User",
  last_name: "Test",
  email: "alex@gmail.com",
  password: "password"
)

user2 = User.create!(
  first_name: "User",
  last_name: "Test",
  email: "user@aaaaaazeaz.fr",
  password: "coucou"
)

file = URI.open('https://res.cloudinary.com/sirchamallow/image/upload/v1645544332/valentin2.jpg')
valentin = Valentin.new(
  name:    "Valentino",
  price: 20,
  user: user2,
  short_description: "Valentino est très dynamique sur le plan culturel et sportif, du à ses nombreuses rencontres tout au long de l’année.",
  long_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  adress: "11 Rue de la Gerbe, 69002 Lyon"
)
valentin.save!
valentin.photo.attach(io: file, filename: 'valentin2.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/sirchamallow/image/upload/v1645544332/valentin1.jpg')
valentina = Valentin.new(
  name:    "Valentina",
  price: 30,
  user: user2,
  short_description: "Valentina vous propose un service d’accueil et d’assistance à la hauteur de vos attentes ;)",
  long_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  adress: "10 avenue des champs-élysées, 75008 Paris"
)
valentina.save!
valentina.photo.attach(io: file, filename: 'valentin1.jpg', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/sirchamallow/image/upload/v1645544332/valentin3.jpg')
val = Valentin.new(
  name:    "Le Val de l'enfer",
  price: 300,
  user: user2,
  short_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  long_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  adress: "20 rue Saint Nicolas, 59000 Lille"
)
val.save!
val.photo.attach(io: file, filename: 'valentin3.jpg', content_type: 'image/jpg')

booking = Booking.create!(
  user: user1,
  valentin: valentin,
  reservation_at: "01/01/2021"
)

booking1 = Booking.create!(
  user: user1,
  valentin: valentina,
  reservation_at: "01/01/2021"
)

booking2 = Booking.create!(
  user: user1,
  valentin: val,
  reservation_at: "01/01/2021"
)

puts 'Finished!'
