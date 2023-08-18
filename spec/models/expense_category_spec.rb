# spec/models/expense_category_spec.rb

require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do

  describe 'instance methods' do
    let(:expense) { Expense.new }
    let(:category) { Category.new }
    let(:expense_category) { ExpenseCategory.new(expense: expense, category: category) }

    it 'is invalid without an expense' do
      expense_category.expense = nil
      expect(expense_category).to_not be_valid
    end

    it 'is invalid without a category' do
      expense_category.category = nil
      expect(expense_category).to_not be_valid
    end
  end

end
