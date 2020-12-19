class SearchEngine

  def initialize(searchString)
    @searchParams = []
    @result = []
    @exludeWords = []
    @searchParams = toAssets(searchString)
    search()
  end

  def result
    @result || []
  end

  private

  def search
    findBySearchParams()
    removeFromResultExlude()
  end

  def findBySearchParams
    @result = @searchParams.map{|asset| 
      LangStorage.assets.has_key?(asset) ?
      LangStorage.assets[asset] : []
    }.flatten.uniq
  end

  def removeFromResultExlude 
    @exludeWords.each() do |ew|
      @result = result.select do |r| 
        r.getAssets().exclude?(ew)
      end
    end
  end

  def toAssets(searchString)
     getWords(
       shiftExludeWords(
       shiftQuotedPhrase(searchString)))
  end

  def shiftQuotedPhrase(searchString)
    searchString.sub(/"(.*)"/){ |match|
      @searchParams.push(match.delete!("\"")); ""}
  end

  def shiftExludeWords(searchString)
    searchString.sub(/--.*/){ |match|
      @exludeWords.push(match.delete!("--")); ""}
  end

  def getWords(searchString)
    searchString.split(" ").each do |word|
      @searchParams.push(word)
    end
  end
end
