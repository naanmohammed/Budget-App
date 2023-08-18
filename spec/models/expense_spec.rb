require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create(name: 'Burger')
    @expense = Expense.new(name: 'Igbo', amount: 10_000, author_id: @user.id)
  end

  describe 'initialization' do
    it 'should be a Expense object' do
      expect(@expense).to be_a Expense
    end

    it 'should have attributes' do
      expect(@expense).to have_attributes(name: 'Igbo', amount: 10_000, author_id: @user.id)
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      @expense.name = nil
      expect(@expense).not_to be_valid
    end

    it 'should validate length of name' do
      @expense.name = 'a'
      expect(@expense).not_to be_valid
      @expense.name = 'a' * 31
      expect(@expense).not_to be_valid
    end

    it 'should validate presence of icon' do
      @expense.amount = nil
      expect(@expense).not_to be_valid
    end

    it 'should validate presence of author_id' do
      @expense.author_id = nil
      expect(@expense).not_to be_valid
    end
  end
end
