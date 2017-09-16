require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("user@bloccit.com").for(:email) }

  it { should validate_presence_of(:password) }
  it { should have_secure_password }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
      it "should have name and email attributes" do
          expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
      end
  end

  describe "invalid user" do
      let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
      let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }

      it "should be an invalid user due to blank name" do
          expect(user_with_invalid_name).to_not be_valid
      end

      it "should be an invalid user due to blank email" do
          expect(user_with_invalid_email).to_not be_valid
      end
  end

  describe "unformatted user name" do
      it "should capitalize the first letter of first and last name" do
          user.name = "bill gates"
          user.save
          expect(user.name).to eq("Bill Gates")
      end
  end
end