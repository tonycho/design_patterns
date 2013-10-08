module DesignPattern
  class Singleton
    @@instance = nil

    def initialize
    end

    def self.instance()
      @@instance == Singleton.new if (!@@instance)
      return @@instance
    end

    #private_class_method :new
  end
end

include DesignPattern

a = Singleton.instance()
b = Singleton.instance()

p a === b