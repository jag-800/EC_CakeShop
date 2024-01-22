# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'a@a', password: 'aaaaaa')

Customer.create!(
  [
    {
      password: '000000',
      last_name: '令和',
      first_name: '道子',
      last_name_kana: 'レイワ',
      first_name_kana: 'ミチコ',
      email: "0@0",
      post_code: '0000000',
      address: '東京都渋谷区神園町0-0',
      phone_number: '00011112222',
      is_active: true
    },
    {
      password: "111111",
      last_name: '難波',
      first_name: '専太',
      last_name_kana: "ナンバ",
      first_name_kana: "センタ",
      email: "1@1",
      post_code: '1111111',
      address: '東京都渋谷区神園町0-1',
      phone_number: "00088889999",
      is_active: true
    },
    {
      password: "222222",
      last_name: '六本木',
      first_name: '一',
      last_name_kana: 'ロッポンギ',
      first_name_kana: 'ハジメ',
      email: "2@2",
      post_code: '2222222',
      address: '東京都渋谷区神園町0-2',
      phone_number: "09177772222",
      is_active: false,
      
    },
    {
      password: "333333",
      last_name: '尾形',
      first_name: '隆弘',
      last_name_kana: 'オガタタ',
      first_name_kana: 'タカヒロ',
      email: "3@3",
      post_code: '3333333',
      address: '東京都渋谷区神園町0-3',
      phone_number: "09177773333",
      is_active: true,
    }
  ]
)

Genre.create!([
    { name: "ケーキ" },
    { name: "焼き菓子" },
    { name: "プリン" },
    { name: "和菓子" },
    { name: "アイス" }
])

Item.create!(
  [
    {
      name: "ショートケーキ",
      introduction: "美味しいケーキだよ",
      price: "2900",
      genre_id: 1,
      is_active: "true",
    },
    {
      name: "シュークリーム",
      introduction: "６個あるよ",
      price: "1650",
      genre_id: 1,
      is_active: "true",
    },
    {
      name: "甘いプリン",
      introduction: "プリンが一番おいしい",
      price: "460",
      genre_id: 3,
      is_active: "true",
    },
    {
      name: "９種のマカロン",
      introduction: "マカロンが９種類！",
      price: "2486",
      genre_id: 2,
      is_active: "true",
    },
    {
      name: "チョコアイス３種類",
      introduction: "チョコ、おいしい",
      price: "2728",
      genre_id: 5,
      is_active: "true",
    },
  ]
)
