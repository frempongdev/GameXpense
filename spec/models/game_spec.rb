require 'rails_helper'

RSpec.describe Game, type: :model do
  before :all do
    @user = User.create(name: 'Kristen Stewart')
    @game = Game.create(name: 'Food', user_id: @user.id)
  end

  describe 'Validation' do
    it 'should validate the presence of a name' do
      @game.name = nil
      expect(@game).to_not be_valid
    end

    it 'should validate the length of the name' do
      @game.name = 'a' * 51
      expect(@game).to_not be_valid
    end
  end

  describe 'Association' do
    it 'should belong to a user' do
      expect(@game.user_id).to eq(@user.id)
    end

    it 'should have many expenses' do
      t = Game.reflect_on_association(:expenses)
      expect(t.macro).to eq(:has_many)
    end
  end
end