module DesignPattern

  #command interface
  class Command
    def execute
    end
  end

  class TVTurnOnCommand < Command
    def initialize(tv)
      @tv = tv
    end

    def execute()
      @tv.turn_on
    end
  end

  class TVTurnOffCommand < Command
    @tv = nil

    def initialize(tv)
      @tv = tv
    end

    def execute()
      @tv.turn_off
    end
  end

# receiver
  class TV
    def turn_on
      puts "tv is turning on"
    end

    def turn_off
      puts "tv is turning off"
    end
  end

# invoker
  class RemoteControl
    def initialize
      @commands = []
    end

    def add_command(command)
      @commands << command
    end

    def run()
      @commands.each do |command|
        command.execute
      end
    end
  end
end

include DesignPattern

tv = TV.new
command_tv_turn_on = TVTurnOnCommand.new(tv)
command_tv_turn_off = TVTurnOffCommand.new(tv)

remote = RemoteControl.new
remote.add_command(command_tv_turn_on)
remote.add_command(command_tv_turn_off)
remote.run