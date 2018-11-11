class BrewFinder::Brewery

  attr_accessor :name, :address, :city_state :phone, :url, :brewery_type

  @all = []

  def initialize(name = nil, address = nil, city_state = nil phone = nil, url = nil, brewery_type = nil)
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
