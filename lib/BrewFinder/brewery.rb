class BrewFinder::Brewery

  attr_accessor :name, :address, :phone, :url, :brewery_type

  @all = []

  def initialize(name = nil, address = nil, phone = nil, url = nil, brewery_type = nil)
    @name = name
    @address = address
    @phone = phone
    @url = url
    @brewery_type = brewery_type
    @@all << self
  end

  def self.all
    @@all
  end

end
