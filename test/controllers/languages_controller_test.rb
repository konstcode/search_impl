require 'test_helper'

class LanguagesControllerTest < ActionDispatch::IntegrationTest

  test "should get search result" do
    get search_url({query: "Ada"})
    assert_response :success
    assert_equal "Ada", ActiveSupport::JSON.decode(@response.body)[0]["name"]
  end

  test "should return json" do
    get search_url({query: "Array"})
    assert_equal "application/json", @response.media_type
  end

end
