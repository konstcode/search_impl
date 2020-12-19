class LanguageTestCase < ActiveSupport::TestCase

  setup do
    LangStorage.new
  end

  test "storage creation" do
    assert LangStorage.assets.any?
    assert LangStorage.items.any?
  end

  test "storage same length after reinitilaze" do
    assets_length = LangStorage.assets.length
    languages_length = LangStorage.items.length
    LangStorage.new
    assert_equal assets_length, LangStorage.assets.length
    assert_equal languages_length, LangStorage.items.length
  end
end
