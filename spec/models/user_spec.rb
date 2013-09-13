require 'spec_helper'

describe User do
  context "without an email address" do
    it "is not valid" do
      user = User.new
      user.should_not be_valid
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

  it "can have many photos" do
    u = User.new(email: "q@b.com", username: "Joe")
    2.times { u.photos << Photo.new }
    expect(u).to be_valid
  end

  describe "#destroy" do
    it "destroys associated photos" do
    photo = Photo.new
    user = User.create!(email: "j@b.com", username: "Joe", photos: [photo])
    expect {user.destroy}.to change {Photo.count}.by -1
    end
  end
end
