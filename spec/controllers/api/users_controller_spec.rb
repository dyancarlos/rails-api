# frozen_string_literal: true

RSpec.describe Api::UsersController, type: :request do
  describe "#index" do
    before do
      create :user, name: "User 1", job: "Job 1", created_at: '2019/10/31 00:00'
      create :user, name: "User 2", job: "Job 2", created_at: '2019/10/31 00:00'
    end
    
    it "get all users" do
      users_response = [
        {id: 1, name: "User 1", job: "Job 1", createdAt: "2019-10-31"},
        {id: 2, name: "User 2", job: "Job 2", createdAt: "2019-10-31"}
      ].to_json

      get '/api/users'
      
      expect(response.body).to eq users_response
    end
  end
  
  describe "#destroy" do
    before { create :user, id: 1, name: "User to destroy" }

    it "destroy a user" do
      expect { delete '/api/users/1' }.to change { User.count }.from(1).to(0)
    end
  end
  
  describe "#update" do
    let!(:user) { create :user, id: 1, name: "User to update" }

    it "update a user" do
      put '/api/users/1', params: { user: { name: "Updated name" } }
      
      expect(user.reload.name).to eq "Updated name"
    end

    it "validate user update" do
      put '/api/users/1', params: { user: { name: '' }}

      expect(response.body).to eq({name: ["can't be blank"]}.to_json)
    end
  end

  describe "#create" do
    let(:params) do
      { user: { name: "User One", job: "Job One" } }
    end

    it "create users" do
      post '/api/users', params: params
      
      expect(User.count).to eq 1
      expect(User.first.name).to eq "User One"
      expect(User.first.job).to eq "Job One"
    end
    
    it "validate user creation" do
      post '/api/users', params: { user: { name: '' }}

      expect(response.body).to eq({name: ["can't be blank"], job: ["can't be blank"]}.to_json)
    end
  end
end