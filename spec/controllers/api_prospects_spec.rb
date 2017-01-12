require 'rails_helper'

RSpec.describe ApiProspectsController, :type => :controller do
  def add_params
    request.headers["username"] = "username"
    request.headers["password"] = "tuskermarvel"
  end

  describe "GET #index" do
    it "returns 422 for unauthenticated params" do
      get :index
      expect(response).to have_http_status(422)
    end

    it "returns a list of prospects" do
      add_params
      get :index
      expect(response.body).to match(/"contact":"Steve"/)
    end
  end

  describe "GET #packages" do
    it "returns a list of packages" do
      add_params
      get :packages
      expect(response.body).to match(/"code":"gr1"/)
    end
  end

  describe "POST #packagesCity" do
    it "returns packages delivered to London" do
      add_params
      post :packagesCity, params: { "city" => "London" }
      expect(response.body).to match(/gr1/)
    end
  end
end