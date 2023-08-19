require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it 'requires a name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end
  end
end
