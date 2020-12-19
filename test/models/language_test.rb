class LanguageTestCase < ActiveSupport::TestCase
  test "user new" do 
    lang = Language.new({ 
      "Name" => "A+",
      "Type" => "Array",
      "Designed by" => "Arthur Whitney"
    })
    assert_equal lang.name, "A+"
    assert_equal lang.types, ["Array"]
    assert_equal lang.authors, ["Arthur Whitney"]
  end
end
