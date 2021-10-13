User.destroy_all
Snack.destroy_all
UsersSnack.destroy_all
Review.destroy_all

user_1 = User.create!(username: 'Roald1991', first_name: 'Roald', last_name: 'Roaldington', email: 'RoaldRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')
user_2 = User.create!(username: 'Larry2020', first_name: 'Larry', last_name: 'Larryington', email: 'LarryRules91@Gmail.Com', password: 'PolarBearsRule11', password_confirmation: 'PolarBearsRule11')

snack_1 = Snack.create!(name: 'Funyuns', description: 'Oniony', savory: true, sweet: false)
snack_2 = Snack.create!(name: 'Star Crunch', description: 'Made with nougat..... I think?', savory: false, sweet: true)
snack_3 = Snack.create!(name: 'Honey Bun', description: 'Honey and Bun-y', savory: false, sweet: true)
snack_4 = Snack.create!(name: 'Doritos', description: 'Bold', savory: true, sweet: false)
snack_5 = Snack.create!(name: 'Cheetos', description: 'The one with the cheetah', savory: true, sweet: false)
snack_6 = Snack.create!(name: 'Mountain Dew', description: 'Climb the mountain', savory: false, sweet: true)
snack_7 = Snack.create!(name: 'Milky Way', description: 'Taste of the galaxy', savory: false, sweet: true)
snack_8 = Snack.create!(name: 'Snickers', description: 'Not trademarked', savory: false, sweet: true)

users_snack_1 = UsersSnack.create!(user_id: user_1.id, snack_id: snack_1.id)
users_snack_2 = UsersSnack.create!(user_id: user_1.id, snack_id: snack_2.id)
users_snack_3 = UsersSnack.create!(user_id: user_1.id, snack_id: snack_3.id)
users_snack_4 = UsersSnack.create!(user_id: user_1.id, snack_id: snack_4.id)
users_snack_5 = UsersSnack.create!(user_id: user_1.id, snack_id: snack_5.id)
users_snack_6 = UsersSnack.create!(user_id: user_2.id, snack_id: snack_1.id)
users_snack_7 = UsersSnack.create!(user_id: user_2.id, snack_id: snack_2.id)
users_snack_8 = UsersSnack.create!(user_id: user_2.id, snack_id: snack_3.id)
users_snack_9 = UsersSnack.create!(user_id: user_1.id, snack_id: snack_7.id)
users_snack_10 = UsersSnack.create!(user_id: user_1.id, snack_id: snack_7.id)
users_snack_11 = UsersSnack.create!(user_id: user_1.id, snack_id: snack_8.id)

review_1 = users_snack_1.reviews.create!(description: 'What a fun way to eat onions, I couldnt believe it when they said they were raw.', rating: 4.6, likes: true)
review_2 = users_snack_2.reviews.create!(description: 'Out of this world.', rating: 4.7, likes: true)
review_3 = users_snack_3.reviews.create!(description: 'The only way I can think to save the bees.', rating: 4.8, likes: true)
review_4 = users_snack_4.reviews.create!(description: 'Best paired with a Mountain Dew.', rating: 4.9, likes: true)
review_5 = users_snack_5.reviews.create!(description: 'Again, the one with the cheetah.', rating: 5.0, likes: true)
review_6 = users_snack_6.reviews.create!(description: 'TASTY!', rating: 5.0, likes: true)
review_7 = users_snack_7.reviews.create!(description: 'My childhood reborn.', rating: 5.0, likes: true)
review_8 = users_snack_8.reviews.create!(description: 'Best warmed up.', rating: 5.0, likes: true)
review_9 = users_snack_9.reviews.create!(description: 'Ew.', rating: 1.0, likes: false)
review_10 = users_snack_10.reviews.create!(description: 'Not great.', rating: 2.6, likes: false)
