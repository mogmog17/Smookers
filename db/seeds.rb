# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@example.jp",
             password:  "11111111",
             password_confirmation: "11111111")

users = User.create!(
  [
    {email: 'hina@test.com', username: 'HINA', password: 'hhhhhh', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user1.jpg"), filename:"user1.jpg")},
    {email: 'syo@test.com', username: 'hirano_syo', password: 'ssssss', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user2.jpg"), filename:"user2.jpg")},
    {email: 'yuta@test.com', username: 'kishi@yuta', password: 'yyyyyy', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user3.jpg"), filename:"user3.jpg")}
  ]
)

Post.create!(
  [
    {title: '代々木公園', spot_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/spot1.jpg"), filename:"spot1.jpg"), body: '代々木公園にある喫煙スポットです！外観もおしゃれで、駅近なのでおすすめです。 ぜひ皆さんも使ってみてください！', user_id: users[0].id },
    {title: '新宿駅', spot_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/spot2.jpg"), filename:"spot2.jpg"), body: '新宿駅の喫煙スポット見つけました！！ 利用しやすかったです。', user_id: users[1].id },
    {title: '東京駅', spot_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/spot3.jpg"), filename:"spot3.jpg"), body: '東京駅の喫煙所です！', user_id: users[2].id }
  ]
)