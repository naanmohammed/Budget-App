require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'Burger')
    @category = Category.new(name: 'Example Category', icon: 'path', author_id: @user.id)
  end

  describe 'initialization' do
    it 'should be a Category object' do
      expect(@category).to be_a Category
    end

    it 'should have attributes' do
      expect(@category).to have_attributes(name: 'Example Category', icon: 'path', author_id: @user.id)
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      @category.name = nil
      expect(@category).not_to be_valid
    end

    it 'should validate length of name' do
      @category.name = 'a'
      expect(@category).not_to be_valid
      @category.name = 'a' * 31
      expect(@category).not_to be_valid
    end

    it 'should validate presence of icon' do
      @category.icon = nil
      expect(@category).not_to be_valid
    end

    it 'should validate presence of author_id' do
      @category.author_id = nil
      expect(@category).not_to be_valid
    end
  end
end
