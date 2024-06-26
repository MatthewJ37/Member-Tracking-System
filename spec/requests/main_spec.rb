require 'rails_helper'

RSpec.describe 'Mains', type: :request do
  # need to run the oauth before each test 
  include_context 'test user requests'

  describe 'GET /index' do
    it 'returns http success' do
      get '/main/index'
      expect(response).to have_http_status(:success)
    end
  end

end
