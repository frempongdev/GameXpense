require 'rails_helper'

RSpec.describe 'Expense feature', type: :feature do
  before(:each) do
    @user_one = User.create!(name: 'Margaret', email: 'user_one@weirdmail.com', password: '690392',
                             password_confirmation: '690392')
    @game_one = Game.create(name: 'Blur', user_id: @user_one.id)
    @expense_one = Expense.create(name: 'Big Tires', amount: 25, user_id: @user_one.id, game_id: @game_one.id)

    visit new_user_session_path
    fill_in 'user_email', with: @user_one.email
    fill_in 'user_password', with: @user_one.password
    click_button 'Next'
  end

  describe 'game_expenses GET  /game/:game_id' do
    it 'shows all expenses that belongs to a specific game' do
      visit game_path(@game_one)
      expect(page).to have_content('Big Tires')
    end

    it 'contains total amount of transactions' do
      visit game_path(@game_one)
      expect(page).to have_content('$25')
    end
  end

  describe 'New Expense Action' do
    it 'redirects to the form to add new expense' do
      visit new_expense_path
      expect(page).to have_content('Please add expense details')
    end
  end
end