require 'rails_helper'

RSpec.describe 'Snack API' do
  before :each do
    @snack = Snack.create!(name: 'Funyuns', description: 'DELICIOUS', savory: true, sweet: false)
  end

  describe '#create' do
    it 'creates a snack' do
      snack_payload = {
        name: 'Doritos',
        description: 'BOLD',
        savory: true,
        sweet: false
      }

      expect(Snack.all.count).to eq(1)

      post '/api/v1/snacks', params: snack_payload, as: :json

      expect(response).to be_successful

      created_snack = JSON.parse(response.body, symbolize_names: true)

      expect(created_snack[:data][:attributes][:name]).to eq(snack_payload[:name])
      expect(created_snack[:data][:attributes][:description]).to eq(snack_payload[:description])
      expect(created_snack[:data][:attributes][:savory]).to eq(snack_payload[:savory])
      expect(created_snack[:data][:attributes][:sweet]).to eq(snack_payload[:sweet])
      expect(created_snack[:data][:attributes][:rating]).to eq(snack_payload[:rating])
    end

    it 'returns errors if snack cannot be created' do
      snack_payload = {
        name: 'Doritos',
        savory: true
      }

      post '/api/v1/snacks', params: snack_payload, as: :json

      expect(response).to_not be_successful

      errors = JSON.parse(response.body, symbolize_names: true)

      expect(errors[:data][:attributes][:errors]).to eq(["Description can't be blank", "Sweet is not included in the list"])
    end
  end

  describe 'update' do
    it 'updates a given snacks attributes' do
      snack_payload = {
        name: 'Doritos'
      }

      expect(@snack.name).to_not eq('Doritos')

      patch "/api/v1/snacks/#{@snack.id}", params: snack_payload, as: :json

      expect(response).to be_successful

      updated_snack = JSON.parse(response.body, symbolize_names: true)

      expect(updated_snack[:data][:attributes][:updates][:name]).to eq(snack_payload[:name])
    end

    it 'returns an error if no snack found' do
      snack_payload = {
        name: 'Doritos'
      }

      patch "/api/v1/snacks/1232341", params: snack_payload, as: :json

      expect(response).to_not be_successful

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:data][:attributes][:message]).to eq('Snack not found for given id.')
    end
  end

  describe '#destroy' do
    it 'deletes a given snack' do
      delete "/api/v1/snacks/#{@snack.id}"

      expect(response).to be_successful

      deleted_response = JSON.parse(response.body, symbolize_names: true)

      expect(deleted_response[:data][:attributes][:message]).to eq('Snack successfully deleted.')
    end

    it 'returns an error if snack is not found' do
      delete '/api/v1/snacks/123434123'

      expect(response).to_not be_successful

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:data][:attributes][:message]).to eq('Snack not found for given id.')
    end
  end

  describe '#index' do
    it 'returns all snacks' do
      get '/api/v1/snacks'

      expect(response).to be_successful

      snacks = JSON.parse(response.body, symbolize_names: true)

      expect(snacks[:data][:attributes][:snacks][0][:name]).to eq('Funyuns')
    end
  end

  describe '#show' do
    it 'returns a single snack' do
      get "/api/v1/snacks/#{@snack.id}"

      expect(response).to be_successful

      snack = JSON.parse(response.body, symbolize_names: true)

      expect(snack[:data][:attributes][:name]).to eq(@snack.name)
    end

    it 'returns an error if snack does not exist' do
      get '/api/v1/snacks/12134141'

      expect(response).to_not be_successful

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:data][:attributes][:message]).to eq('Snack not found for given id.')
    end
  end
end
