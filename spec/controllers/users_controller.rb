require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { User.create!(email: "test@test.com", password: "12345678") }

  describe 'GET #show' do
    context 'when a user is logged in' do
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = FactoryBot.build(:user)
        # user = User.create!(:user)
        user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
        sign_in user
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    it 'loads correct user details' do
      get :show
      expect(response).to be_ok
      expect(assigns(:user)).to eq user
    end

  end
end
