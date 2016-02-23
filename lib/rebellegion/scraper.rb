require "pry"
require "open-uri"
require_relative "../rebellegion.rb"

class RebelLegion::Scraper
  attr_accessor :categories

  def initialize
    @categories = {}
    get_categories("http://www.rebellegion.com/costume-standards/by-category/")
    make_costume_categories
  end

  def get_categories(url) # gets the main costume category list
    doc = Nokogiri::HTML(open(url))
    doc.css("div#left-area article.entry-content.clearfix p").each do |category|
      categories[category.css("a").text] = category.css("a").attribute("href").value
    end
  end

  def make_costume_categories # send data to CostumeCategory class
    categories.each do |name, url|
      RebelLegion::CostumeCategory.new(name, url)
    end
  end

  def get_costumes # gets a costume page
    RebelLegion::CostumeCategory.all.each do |name, url|

    end
  end

  def make_costume(data) # sends costume data to the Costume class
  end
end

RebelLegion::Scraper.new