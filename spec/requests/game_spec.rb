require 'rails_helper'

RSpec.describe 'Games', type: :request do
  describe 'GET games/' do
    it 'returns http redirect' do
      get '/games/'
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /new' do
    it 'returns http redirect' do
      get '/games/new'
      expect(response).to have_http_status(:redirect)
    end
  end
end
