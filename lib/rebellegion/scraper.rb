require "pry"
require "open-uri"
require_relative "../rebellegion.rb"
require_relative "./costume_category.rb"
require_relative "./costume.rb"

class RebelLegion::Scraper
  attr_accessor :categories

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

  def get_and_make_costumes # collects titles & urls of costume pages, sends to Costume class
    RebelLegion::CostumeCategory.all.each do |costume_category|
      doc = Nokogiri::HTML(open(costume_category.url))
      doc.css("div#left-area article.entry-content.clearfix div.et_pt_blogentry.clearfix").each do |costume|
        RebelLegion::Costume.new(costume.css("h2.et_pt_title a").text, costume_category, costume.css("h2.et_pt_title a").attribute("href").value)
      end
    end
  end

  def get_costume_details # details scraped from each costume's url
    RebelLegion::Costume.all.each do |costume|
      doc = Nokogiri::HTML(open(costume.url))
    end
  end
end

RebelLegion::Scraper.new