class BrewFinder::CLI

  def call
    puts "Welcome to BrewFinder! The best place to find breweries in your state!"
     start
  end

  def start
    puts ""
    puts "Please enter the abbreviation of the state you would like a list of breweries for:"

    BrewFinder::Scraper.get_page
  end

  def self.create_list
    puts "Here is a list of places to drink near you!"

    BrewFinder::Scraper::breweries.each_with_index.map {|n, index| puts "#{index+1}. #{n}"

    self.show_details
  end

  def self.more_info
    puts "If you would like to see the list of breweries again type 'list'"
    puts "To search a new state type 'back' or type 'exit' to exit"

    input = gets.strip
      case input
        when "back"
          BrewFinder::CLI.new.start
        when "exit"
          exit
        when "list"
          self.create_list
        else
          puts ""
          puts "Not a valid choice!"
          self.more_info
        end
    end

    def self.show_details
      puts ""
      puts "Which Brewery are you interested in learning more about:"
      BrewFinder::Scraper.find_details_page
    end

    def self.more_details
      BrewFinder::Scraper.create_brewery

      puts ""
      puts BrewFinder::Scraper::name
      puts ""
      puts BrewFinder::Scraper::address
      puts ""
      puts "Contact Info:"
      puts BrewFinder::Scraper::phone
      puts BrewFinder::Scraper::url
      puts ""
      puts "Type:"
      puts BrewFinder::Scraper::brewey_type
      puts ""
      self.more_info
    end

    def self.retry
      puts ""
      puts "I didnt quite get that. Please try again."
      BrewFinder::CLI.new.start
    end
end
