require 'rails_helper'

RSpec.describe "Gifs", type: :request do
  describe "GET /cool" do
    it "returns http success" do
      get "/gif/cool"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /free" do
    it "returns http success" do
      get "/gif/free"
      expect(response).to have_http_status(:success)
    end
  end

end
