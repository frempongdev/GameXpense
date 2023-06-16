require 'rails_helper'

RSpec.describe 'Game Feature', type: :feature do
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

  describe 'Index Game Action' do
    it 'shows all games' do
      visit games_path
      expect(page).to have_content('Add game')
      expect(page).to have_content('Blur')
    end
  end

  describe 'Show Game Action' do
    it 'shows a game' do
      visit game_path(@game_one.id)
      expect(page).to have_content('Big Tires')
    end

    it 'contains total amount of transactions' do
      visit game_path(@game_one.id)
      expect(page).to have_content('$25')
    end
  end

  describe 'New Game Action' do
    it 'redirects to the form to add new game' do
      visit new_game_path
      expect(page).to have_content('Please add Game')
    end
  end
end
