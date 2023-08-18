require 'rails_helper'

RSpec.describe 'categories/show.html.erb', type: :view do
  before(:each) do
    @user = User.create(name: 'naan', email: 'naan@gmail.com', password: '123456')
    @category = Category.create(name: 'Transportation', author_id: @user.id, icon: 'transportation.webp')
    @expense = Expense.create(author_id: @user.id, name: 'Car', amount: 500)

    assign(:category, @category)
    assign(:expenses, [@expense])

    render
  end

  it 'displays the expense details in the category show page' do
    within '.expense-group' do
      expect(page).to have_content('Car')
      expect(page).to have_content('$500.00')
      expect(page).to have_content('9 August 2023 at 04:15PM')
    end
  end
end
