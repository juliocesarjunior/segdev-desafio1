require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Creation' do
    it "creates a user with valid attributes" do
      expect { FactoryBot.create(:user) }.to change(User, :count).by(1)
    end

    it "does not create user without email" do
      expect { FactoryBot.create(:user, email: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "does not create user without password" do
      expect { FactoryBot.create(:user, password: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "does not create user with mismatched password confirmation" do
      expect { FactoryBot.create(:user, password_confirmation: 'invalid_password') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_confirmation_of(:password) }
  end
end