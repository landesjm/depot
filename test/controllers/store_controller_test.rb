require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'ScubaPro SeaHawk BCD'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

  test "should get counter text on page visit 6" do
    6.times { get :index }
    assert_select '.counter', "6 Visits to page"
  end

end
