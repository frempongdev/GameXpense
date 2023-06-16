require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/expenses'
      expect(response).to have_http_status(:success)
    end
  end
end
