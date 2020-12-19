
class Language

  attr_accessor :name, :types, :authors

  def initialize(hash_lang)     
    @name = hash_lang["Name"]
    @types = hash_lang["Type"].split(", ")
    @authors = hash_lang["Designed by"].split(", ")
  end

  def getAssets
    [@name, *@types, *@authors]
  end
end



