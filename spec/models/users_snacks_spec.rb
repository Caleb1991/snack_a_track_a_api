require 'rails_helper'

RSpec.describe UsersSnacks do
  describe 'relationships' do
    it {should belong_to(:user)}
    it {should belong_to(:snack)}
  end
end
