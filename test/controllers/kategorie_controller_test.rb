require 'test_helper'

class KategorieControllerTest < ActionDispatch::IntegrationTest
  test "should get servise" do
    get kategorie_servise_url
    assert_response :success
  end

  test "should get partner" do
    get kategorie_partner_url
    assert_response :success
  end

  test "should get servise_center" do
    get kategorie_servise_center_url
    assert_response :success
  end

  test "should get introductionn" do
    get kategorie_introductionn_url
    assert_response :success
  end

end
