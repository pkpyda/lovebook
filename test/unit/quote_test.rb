require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "quote should have user_id" do
  	quote = Quote.new
  	assert !quote.save
  	assert !quote.errors[:user_id].empty?
  end

  test "quote should have content" do
  	quote = Quote.new
  	assert !quote.save
  	assert !quote.errors[:content].empty?
  end

  test "quote should have minimum length of size 2" do
    quote = Quote.new
    quote.content = "h"
    assert !quote.save
    assert !quote.errors[:content].empty?
  end
end
