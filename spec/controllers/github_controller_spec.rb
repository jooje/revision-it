require 'spec_helper'

describe GithubController do

  describe "GET 'import_all'" do
    it "returns http success" do
      get 'import_all'
      response.should be_success
    end
  end

  describe "GET 'hook'" do
    it "returns http success" do
      get 'hook'
      response.should be_success
    end
  end

end
