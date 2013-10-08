module DesignPattern
  attr_accessor :name
  class Entry
    def initialize name
      @name = name
    end
  end

  class Offer
    attr_accessor :name, :expired_date

    def initialize name
      @entries = []
      @name = name
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

  class TestOfferStrategoy
    def initialize offer
      @offer = offer
    end

    def simulate_draw_winner
      entrants = ['Tony Cho', 'Michael Jelks', 'Brian Kim', 'Michi Kono', 'Doug Mak']

      entrants.each do |entrant|
        @offer.add_entry(Entry.new(entrant))
      end

      p "The Offer: " + @offer.name
      @offer.draw_winner
      puts "\n"
    end

  end
end

include DesignPattern

strategy = TestOfferStrategoy.new(Giveaway.new('Big Promotion'))
strategy.simulate_draw_winner

strategy = TestOfferStrategoy.new(Coupon.new('Big Coupon'))
strategy.simulate_draw_winner
