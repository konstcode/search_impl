
class SearchEngineTest < ActiveSupport::TestCase
  test "search by name" do
    result = SearchEngine.new("ActionScript").result()
    p result
    assert_equal result.length,
      result.select{|r| r.name.eql?("ActionScript")}.length
  end

  test "search by type" do
    result = SearchEngine.new("Compiled").result()
    assert_equal result.length, result.select{|r| r.types.include?("Compiled")}.length
  end

  test "search by author" do
    result = SearchEngine.new("Samelson").result()
    assert_equal result.length, result.select{|r| r.authors.include?("Samelson")}.length
  end

  test "search multiples words" do 
    result = SearchEngine.new("ActionScript Samelson").result()
    assert_equal result.length, result.select{
      |r| r.authors.include?("Samelson") || r.name.eql?("ActionScript") }.length
  end

  test "search phrases" do 
    result = SearchEngine.new("\"Robert Sutor\" ActionScript Samelson").result()
    assert_equal result.length, result.select {|r|
          r.authors.include?("Samelson") ||
          r.name.eql?("ActionScript") ||
          r.authors.include?("Robert Sutor")
    }.length
  end

  test "search with excluding" do
    result = SearchEngine.new("Reflective --ActionScript").result()
    assert_equal result.length, result.select{ |r|
      r.types.include?("Reflective") &&
      !r.name.eql?("ActionScript")
    }.length
  end
end
