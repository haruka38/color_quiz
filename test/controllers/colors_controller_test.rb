require "test_helper"

class ColorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get colors_show_url
    assert_response :success
  end

  test "should get answer" do
    get colors_answer_url
    assert_response :success
  end
end
