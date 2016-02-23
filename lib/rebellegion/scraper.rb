require "pry"
require "open-uri"
require_relative "../rebellegion.rb"
require_relative "./costume_category.rb"
require_relative "./costume.rb"

class RebelLegion::Scraper
  attr_accessor :categories, :costume_pages

  def initialize
    @categories = {}
    @costume_pages = {}
    get_categories("http://www.rebellegion.com/costume-standards/by-category/")
    make_costume_categories
    get_costumes
    # make_costume
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

  def get_costumes # collects titles & urls of costume pages
    RebelLegion::CostumeCategory.all.each do |costume_category|
      doc = Nokogiri::HTML(open(costume_category.url))
      doc.css("div#left-area article.entry-content.clearfix div.et_pt_blogentry.clearfix").each do |costume|
        costume_pages[costume.css("h2.et_pt_title a").text] = costume.css("h2.et_pt_title a").attribute("href").value
      end
    end
  end

  def make_costume # sends costume data to the Costume class: costume.name will be from costume_pages key, details scraped from url (value)
  end
end

RebelLegion::Scraper.new