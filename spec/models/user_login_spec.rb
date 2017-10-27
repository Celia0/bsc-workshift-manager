require 'spec_helper'
require 'User'

describe User do

    before(:each) do
        @user = "Username of some sort"
        @pass = "Password of some sort"
    end

    it "accepts a username and password" do
        expect(User).to receive(:create)
        User.init(@user, @pass)
    end

    it "correctly hides the password" do
        allow(User).to receive(:create).with(username: @user, password: @pass, )
        User.init(@user, @pass)
    end

    it "properly saves" do
        v = User.init(@user, @pass)
        expect(v).to eq(true)
    end

    it "validates a valid user" do
        User.create(username: @user, hashed_pass: @hash)
        expect(User.validate(@user, @pass)).to eq(true)
    end

    it "invalidates an invalid user" do
        User.create(username: @user, hashed_pass: @hash)
        expect(User.validate(@user, "rubyistheworst")).to eq(false)
    end

end
