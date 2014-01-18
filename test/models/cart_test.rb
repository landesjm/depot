require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "add unique products to cart" do
    cart = Cart.create
    bcd = products(:bcd)
    reg  = products(:regulator)
    cart.add_product(bcd.id).save!
    cart.add_product(reg.id).save!
    assert_equal 2, cart.line_items.size, 'cart has two line items'
    assert_equal bcd.price + reg.price, cart.total_price, 'cart price is equal to sum of bcd + reg'
  end

  test "add duplicate product to cart" do
    cart = Cart.create
    bcd = products(:bcd)
    cart.add_product(bcd.id).save!
    cart.add_product(bcd.id).save!
    assert_equal 1, cart.line_items.size, 'cart has only one line item'
    assert_equal 2* bcd.price, cart.total_price, 'cart price is two times bcd price'
    assert_equal 2, cart.line_items[0].quantity, 'bcd has a quantity of 2'
  end

end
