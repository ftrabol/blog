require 'test_helper'

class HeroControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hero_index_url
    assert_response :success
  end

  test "should get new" do
    get hero_new_url
    assert_response :success
  end

  test "should get create" do
    get hero_create_url
    assert_response :success
  end

end
