class BrewFinder::Scraper

  def self.get_page
    input = gets.strip.to_s.upcase
    @doc = Nokogiri::HTML(open("https://www.brewersassociation.org/directories/breweries/"))
    self.scrape_results
  end

  def self.create_brewery(name = nil, address = nil, phone = nil, url = nil, brewery_type = nil)
    BrewFinder::Brewery.new(
      @name = @deets.css("li.name").text,
      @address = @deets.css("li.address").text.strip,
      @city_state = @deets.css("li").text,
      @phone = @deets.css("li.telephone").text,
      @url = @deets.css("a").text.gsub(/\s+/, " ").strip,
      @brewery_type = @deets.css("li.brewery_type").text.gsub(/\s+/, " ").strip
    )

    class << self
        attr_accessor :name, :address, :city_state, :phone, :url, :brewery_type
    end

  end

  def self.scrape_results
    @breweries = @doc.css("li.name").map {|name| name.text}.uniq

    class << self
      attr_accessor :breweries
    end

      if @breweries != []
        BrewFinder::CLI.create_list
      else
        BrewFinder::CLI.retry
      end
  end

  def self.find_details_page
      info = gets.strip.to_i

        if info > @restaurants.size || info == 0
          puts "Invalid choice. Select a number from the list above:"
          self.find_details_page
        else
          details = @doc.css("div.brewery").map {|link| link['href']}.uniq
          @deets = Nokogiri::HTML(open("https://www.brewersassociation.org/directories/breweries/" << details[info-1].to_s))
          BrewFinder::CLI.more_details
        end
    end

end
