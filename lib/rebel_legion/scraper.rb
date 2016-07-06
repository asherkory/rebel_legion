class RebelLegion::Scraper
  attr_accessor :categories

  def initialize
    puts "Loading....."
    @categories = {}
    @costume_pages = {}
    get_categories("http://www.rebellegion.com/costume-standards/by-category/")
    make_costume_categories
  end

  def get_categories(url) # gets the main costume category list
    doc = Nokogiri::HTML(open(url))
    doc.css("div#left-area article.entry-content.clearfix p").each do |category|
      categories[category.css("a").text] = category.css("a").attribute("href").value
    end
  end

  def make_costume_categories # sends data to CostumeCategory class
    categories.each do |name, url|
      RebelLegion::CostumeCategory.new(name, url)
    end
  end

  def get_and_make_costumes # collects titles & urls of costume pages, sends to Costume class
    RebelLegion::CostumeCategory.all.each do |costume_category|
      self.class.scrape_costumes_for_category(costume_category)
    end
  end

  def self.scrape_costumes_for_category(costume_category)
      doc = Nokogiri::HTML(open(costume_category.url))
      doc.css("div#left-area article.entry-content.clearfix div.et_pt_blogentry.clearfix").each do |costume|
        costume_category.new_costume(costume.css("h2.et_pt_title a").text, costume.css("h2.et_pt_title a").attribute("href").value)
      end
  end

  def get_costume_details # scrapes each costume's details and sends to that costume
    RebelLegion::Costume.all.each do |costume|
      doc = Nokogiri::HTML(open(costume.url))
      doc.css("div#left-area article.entry-content.clearfix div.et-box.et-shadow div.et-box-content").each do |item|
        if !item.css("ol li").empty? # edge case
          item.css("ol li").each { |subitem| costume.details << subitem.text }
        else
          costume.details << item.text
        end
      end
    end
  end
end