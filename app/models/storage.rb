DATAFILEPATH = Rails.root.join('data.json')

class Storage 
  @@items = []
  @@assets = {}

  def initialize(className)
    if @@items.empty? then
      getItemsDataFromFile.each do |itemInfo|
        item = className.constantize.new(itemInfo)
        @@items.push(item)
        Storage.addAssets(item)
      end
    end
  end

  def getItemsDataFromFile
    file = File.open(DATAFILEPATH)
    parseJson(file.read)
  end

  def self.assets 
    @@assets
  end

  def self.items
    @@items
  end

  def self.addAssets(item)
    item.getAssets().each do |asset|
      @@assets.has_key?(asset) ? @@assets[asset].push(item) : @@assets[asset] = [item]
      @@assets[asset].uniq!
    end
  end 

  protected
  def parseJson(source)
    ActiveSupport::JSON.decode(source) 
  end
end


