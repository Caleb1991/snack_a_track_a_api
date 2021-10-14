require 'rails_helper'

RSpec.describe User do
  before :each do
    @user_1 = User.create!(username: 'Roald1991', first_name: 'Roald', last_name: 'Roaldington', email: 'RoaldRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')
    @user_2 = User.create!(username: 'Larry1122', first_name: 'Larry', last_name: 'Larryington', email: 'LarryRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')
    @user_3 = User.create!(username: 'Nataboo', first_name: 'Natalie', last_name: 'Natington', email: 'NatalieRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')

    @snack_1 = Snack.create!(name: 'Funyuns', description: 'Oniony', savory: true, sweet: false)
    @snack_2 = Snack.create!(name: 'Star Crunch', description: 'Made with nougat..... I think?', savory: false, sweet: true)
    @snack_3 = Snack.create!(name: 'Honey Bun', description: 'Honey and Bun-y', savory: false, sweet: true)
    @snack_4 = Snack.create!(name: 'Doritos', description: 'Bold', savory: true, sweet: false)
    @snack_5 = Snack.create!(name: 'Cheetos', description: 'The one with the cheetah', savory: true, sweet: false)
    @snack_6 = Snack.create!(name: 'Nachos', description: 'Not bad', savory: true, sweet: false)
    @snack_7 = Snack.create!(name: 'Hot Dogs', description: 'Also not impressive', savory: true, sweet: false)
    @snack_8 = Snack.create!(name: 'Sun Chips', description: 'Sunny', savory: true, sweet: false)
    @snack_9 = Snack.create!(name: 'Popcorn', description: 'Poppable', savory: true, sweet: false)
    @snack_10 = Snack.create!(name: 'Cauliflower', description: 'Delicious', savory: true, sweet: false)
    @snack_11 = Snack.create!(name: 'Broccoli', description: 'Like Trees', savory: true, sweet: false)
    @snack_12 = Snack.create!(name: 'Soup', description: 'Like Trees', savory: true, sweet: false)
    @snack_13 = Snack.create!(name: 'Gushers', description: 'Like Trees', savory: true, sweet: false)

    @users_snack_1 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_1.id)
    @users_snack_2 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_2.id)
    @users_snack_3 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_3.id)
    @users_snack_4 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_4.id)
    @users_snack_5 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_5.id)
    @users_snack_6 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_6.id)
    @users_snack_7 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_7.id)
    @users_snack_8 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_8.id)
    @users_snack_9 = UsersSnack.create!(user_id: @user_1.id, snack_id: @snack_9.id)
    @users_snack_10 = UsersSnack.create!(user_id: @user_2.id, snack_id: @snack_1.id)
    @users_snack_11 = UsersSnack.create!(user_id: @user_2.id, snack_id: @snack_10.id)
    @users_snack_12 = UsersSnack.create!(user_id: @user_2.id, snack_id: @snack_11.id)
    @users_snack_13 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_1.id)
    @users_snack_14 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_2.id)
    @users_snack_15 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_3.id)
    @users_snack_16 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_4.id)
    @users_snack_17 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_5.id)
    @users_snack_18 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_6.id)
    @users_snack_19 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_7.id)
    @users_snack_20 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_8.id)
    @users_snack_21 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_9.id)
    @users_snack_22 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_10.id)
    @users_snack_23 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_11.id)
    @users_snack_24 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_12.id)
    @users_snack_25 = UsersSnack.create!(user_id: @user_3.id, snack_id: @snack_13.id)

    @review_1 = @users_snack_1.reviews.create!(description: 'What a fun way to eat onions, I couldnt believe it when they said they were raw', rating: 4.6, likes: true)
    @review_2 = @users_snack_2.reviews.create!(description: 'Out of this world.', rating: 4.7, likes: true)
    @review_3 = @users_snack_3.reviews.create!(description: 'The only way I can think to save the bees.', rating: 4.8, likes: true)
    @review_4 = @users_snack_4.reviews.create!(description: 'Best paired with a Mountain Dew.', rating: 4.9, likes: true)
    @review_5 = @users_snack_5.reviews.create!(description: 'Again, the one with the cheetah.', rating: 5.0, likes: true)
    @review_6 = @users_snack_6.reviews.create!(description: 'Again, the one with the cheetah.', rating: 1.0, likes: false)
    @review_7 = @users_snack_7.reviews.create!(description: 'Again, the one with the cheetah.', rating: 0.5, likes: false)
    @review_8 = @users_snack_8.reviews.create!(description: 'What a fun way to eat onions, I couldnt believe it when they said they were raw', rating: 1.0, likes: false)
    @review_9 = @users_snack_9.reviews.create!(description: 'Radical', rating: 0.9, likes: false)
    @review_10 = @users_snack_10.reviews.create!(description: 'Amazing', rating: 0.8, likes: false)
    @review_11 = @users_snack_11.reviews.create!(description: 'Amazing', rating: 4.0, likes: true)
    @review_12 = @users_snack_12.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_13 = @users_snack_13.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_14 = @users_snack_14.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_15 = @users_snack_15.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_16 = @users_snack_16.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_17 = @users_snack_17.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_18 = @users_snack_18.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_19 = @users_snack_19.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_20 = @users_snack_20.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_21 = @users_snack_21.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_22 = @users_snack_22.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_23 = @users_snack_23.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_23 = @users_snack_24.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
    @review_23 = @users_snack_25.reviews.create!(description: 'Amazing', rating: 2.9, likes: true)
  end

  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password_digest)}
  end

  describe 'relationships' do
    it {should have_many(:users_snacks)}
    it {should have_many(:snacks).through(:users_snacks)}
    it {should have_many(:reviews).through(:users_snacks)}
  end

  describe '#recommend_snacks' do
    it 'recommend snacks via a collabrative filter algorithm' do
      recommended_snacks = @user_1.recommend_snacks

      expect(recommended_snacks.include?(@snack_10)).to eq(true)
      expect(recommended_snacks.include?(@snack_11)).to eq(true)
      expect(recommended_snacks.include?(@snack_12)).to eq(true)
      expect(recommended_snacks.include?(@snack_13)).to eq(true)
    end
  end
end
