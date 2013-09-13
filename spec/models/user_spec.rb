require 'spec_helper'

describe User do
  context "without an email address" do
    it "is not valid" do
      user = User.new
      user.should_not be_valid
    end

    it "fails validation" do
      expect(User.new).to have(1).error_on(:email)
    end
  end

  context "with an email address" do
    it "has a unique email address" do
      u1 = User.new
      u1.email = "a@b.com"
      u1.save
      u2 = User.new
      u2.email = "a@b.com"
      u2.should_not be_valid
    end

  end
  context "without a username" do
    it "is not valid" do
      user = User.new
      user.should_not be_valid
    end

    it "fails validation" do
      expect(User.new).to have(1).error_on(:username)
    end
  end

  context "with a username" do
    it "has a unique username" do
      u1 = User.new(email: "a@b.com", username:"joe")
      u1.save
      u2 = User.new(email: "a@b2.com", username:"joe")
      u2.should_not be_valid
    end

  end
end
