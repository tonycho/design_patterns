class Dish
  attr_reader :type

  def initialize type = 'Generic'
    @type = type
  end
end

class ChinaDish < Dish
  def initialize
    super "China"
  end
end

class WesternDish < Dish
  def initialize
    super "Western"
  end
end

class TestDishFactory < Dish
  def self.instance type
     case type
       when "china"
         ChinaDish.new
       when "western"
         WesternDish.new
       else
         Dish.new
     end
  end

  private_class_method :new
end

class TestDishesFactory
  attr_reader :dishes

  def initialize count
    @dishes = []
    type = ['china', 'western']
    count.times do |i|
      @dishes << TestDishFactory.instance(type[rand(1000)%2])
    end
  end
end

TestDishesFactory.new(10).dishes.each do |dish|
  p dish.type
end
