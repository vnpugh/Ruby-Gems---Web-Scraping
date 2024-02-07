
require "nokogiri"
require "httparty"

#use the HTTParty.get method to make a GET request to the Wikipedia page for the year.
class API
    def self.get_films_by_year(year)
        url = "https://en.wikipedia.org/wiki/#{year}_in_film"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page.body)

        # extract the elements as nokogiri instances
        films = parsed_page.css("table.wikitable.sortable tr td:nth-child(2) i a").map { |film| film.text.strip }
        films.each_with_index do |film, index|
            puts "#{index + 1}. #{film}"
          end
        end
      end
      
      API.get_films_by_year(2020)


=begin
Output -> list of films from 2020
$ ruby webscraper.rb
1. Demon Slayer: Kimetsu no Yaiba – The Movie: Mugen Train
2. The Eight Hundred
3. My People, My Homeland
4. Bad Boys for Life
5. Tenet
6. Sonic the Hedgehog
7. Dolittle
8. Jiang Ziya
9. A Little Red Flower
10. Shock Wave 2
=end

=begin
*Note: Web scraping is a powerful tool. However, it can be very slow and difficult to maintain. 
In a practical sense you would not use web scraping to get data from a website.
You would use an API.
=end

