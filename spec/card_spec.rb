#1.8.7/1.9.x handling
require_relative '../card' if defined?(require_relative)
require 'card' unless defined?(require_relative)

describe Card do
  describe "#valid" do
    it "should validate a valid MC" do
      card = Card.new("5555555555554444")
      card.valid?.should eql true
      card.type.should eql "MasterCard"
    end

    it "should validate a valid Visa" do
      card = Card.new("4111111111111111")
      card.valid?.should eql true
      card.type.should eql "VISA"
    end

    it "should not validate an invalid Visa" do
      card = Card.new("411111111111111a")
      card.valid?.should eql false
    end

    it "should validate a valid Visa with dashes" do
      card = Card.new("4111-1111-1111-1111")
      card.valid?.should eql true
      card.type.should eql "VISA"
    end

    it "should validate a valid Visa with spaces" do
      card = Card.new("4111 1111 1111 1111")
      card.valid?.should eql true
      card.type.should eql "VISA"
    end

    it "should validate a valid Discover" do
      card = Card.new("6011111111111117")
      card.valid?.should eql true
      card.type.should eql "Discover"
    end

    it "should validate a valid AMEX" do
      card = Card.new("378282246310005")
      card.valid?.should eql true
      card.type.should eql "AMEX"
    end

    it "should validate a valid AMEX" do
      card = Card.new("378282246310005")
      card.valid?.should eql true
      card.type.should eql "AMEX"
    end
  end
end