require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class Scrapper
  def self.scrap(search)
    uri = URI.parse("https://www.chefkoch.de/rs/s0/" + search + "/Rezepte.html")
    doc = Nokogiri::HTML(uri.open)
    titles = doc.search('ul.search-list div.search-list-item-title').map(&:text)
    difficulty = doc.search('ul.search-list span.search-list-item-difficulty').map(&:text)
    time = doc.search('ul.search-list span.search-list-item-preptime').map(&:text)
    description = doc.search('ul.search-list p.search-list-item-subtitle').map(&:text)
    recipes = []
    titles.each_with_index do |title, index|
      recipes << Recipe.new(title, description[index], difficulty[index], time[index], false)
    end
    return recipes
  end
end
