class RebelLegion::Costume
  attr_accessor :name # probably a bunch more
  attr_reader :costume_category

  def initialize(name, costume_category) 
    @name = name
    self.costume_category = costume_category
    @@all << self
  end

  def costume_category=(category)
    @costume_category = category
    category.add_costume(self)
  end

  def view_details
  end


end