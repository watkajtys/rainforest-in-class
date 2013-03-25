require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@p = FactoryGirl.create(:product)
  	assert @p.valid?
  end

  test "must have a name" do
  	@p.name = ""
  	refute @p.valid?
  end

  test "must have a description" do
  	@p.description = ""
  	refute @p.valid?
  end

  test "price_in_cents must be an integer" do
  	@p.price_in_cents = 1.5
  	refute @p.valid?
  end

  test "must have a price_in_cents" do
  	@p.price_in_cents = nil
  	refute @p.valid?
  end

  test "Price in cents is equal to price in dollars" do 
  	@p.price_in_dollars = 3.15
  	assert_equal 315, @p.price_in_cents
  end

  test "Price in dollars is equal to price in cents" do 
  	@p.price_in_cents = 5000
  	assert_equal 50.00, @p.price_in_dollars
  end

  test "must refute invalid price_in_dollars" do 
  	@p.price_in_cents = nil
  	@p.price_in_dollars = "abc"

  	assert_equal nil, @p.price_in_dollars
  	refute @p.valid?
  end

  test "must handle many decimal places price_in_dollars" do 
  	@p.price_in_cents = nil
  	@p.price_in_dollars = 12.90123

  	assert_equal 12.90, @p.price_in_dollars
  	assert_equal 1290, @p.price_in_cents
  	assert @p.valid?
  end

  test "dollar conversion is not performed for empty cents value" do 
  	@p.price_in_cents = nil
  	assert_nil @p.price_in_dollars
  end

end
