module DesignPattern
  attr_accessor :name
  class Entry
    def initialize name
      @name = name
    end
  end

  class Offer
    attr_accessor :name, :expired_date

    def initialize
      @entries = []
    end

    def add_entry entry
      @entries << entry
    end

    def draw_winner()
      winner = @entries[rand(@entries.count)]
      if winner
        p "The winner is #{winner.name}"
      else
        p "No Entrants yet"
      end
    end
  end

  class Giveaway < Offer
  end

  class Coupon < Offer
    def draw_winner()
      super
      p "The coupon is 50%OFF"
    end
  end
end

include DesignPattern

giveaway = Giveaway.new
giveaway.name = "Big Sweepstakes"
giveaway.expired_date = Time.now + 14

entrants = ['Tony Cho', 'Michael Jelks', 'Brian Kim', 'Michi Kono', 'Doug Mak']

entrants.each do |entrant|
  giveaway.add_entry(Entry.new(entrant))
end

giveaway.draw_winner


coupon = Coupon.new
coupon.name = "Big 50% off Coupon"
coupon.expired_date = Time.now + 14

entrants.each do |entrant|
  coupon.add_entry(Entry.new(entrant))
end

coupon.draw_winner
