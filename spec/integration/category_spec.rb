require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :view do
  describe 'integration tests for category page' do
    before(:each) do
      @user = User.create(name: 'naan', email: 'naan@gmail.com', password: '123456')

      view.controller.session[:current_user_id] = @user.id

      @category1 = Category.create(name: 'Transportation', author_id: @user.id, icon: 'transportation.webp')
      @category2 = Category.create(name: 'Feeding', author_id: @user.id, icon: 'feeding.webp')
      @category3 = Category.create(name: 'Health', author_id: @user.id, icon: 'healthcare.webp')

      assign(:categories, [@category1, @category2, @category3])

      render
    end

    it 'displays categories on the categories page' do
      expect(rendered).to have_content 'Transportation'
      expect(rendered).to have_content 'Feeding'
      expect(rendered).to have_content 'Health'
    end
  end
end
