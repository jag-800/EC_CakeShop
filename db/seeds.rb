# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'admin@example.com', password: 'password')

Customer.create!(
  password: 'aaaaaa',
  last_name: '令和',
  first_name: '道子',
  last_name_kana: 'レイワ',
  first_name_kana: 'ミチコ',
  email: "sample@example.com",
  post_code: '0000000',
  address: '東京都渋谷区神園町0-0',
  phone_number: '0000000000',
  is_active: true
)