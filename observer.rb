
module Subject
  def initialize
    @observers = []
  end

  def add_observer observer
    @observers << observer
  end

  def notify_observers
    @observers.each do |observer|
      observer.notify()
    end
  end
end

module DesignPattern
  class SMSNotifier
    def initialize(*texts)
      @texts = []
      texts.each do |text|
        @texts << text
      end
    end

    def notify
      @texts.each do |sms|
        puts "I am notifying SMS #{sms}"
      end
    end
  end

  class EmailNotifier
    def initialize(*emails)
      @emails = []
      emails.each do |email|
        @emails << email
      end
    end

    def notify
      @emails.each do |email|
        puts "I am notifying Email #{email}"
      end
    end
  end

  class Car
    include Subject

    attr_reader :gas

    FULL_TANK = 100
    GAS_ALERT = 20


    def initialize
      super

      add_observer(EmailNotifier.new("tony@splurgy.com", 'mike@splurgy.com'))
      add_observer(SMSNotifier.new('415.272.1588'))

      @gas = FULL_TANK
    end

    def fill_gas(liter)
      @gas = @gas + liter
      @gas = (@gas >= FULL_TANK)? FULL_TANK : @gas
    end

    def move()

      if @gas > 0
        @gas -= 10
        if (@gas <= GAS_ALERT)
          notify_observers()
        end
      else
        @gas = 0
        puts "Your car stalls because it is running out of gas"
        notify_observers()
      end
    end
  end
end


include DesignPattern

car = Car.new

20.times do |i|
  car.move
  p "GAS LEVEL: " + car.gas.to_s
end