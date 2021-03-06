module Ellington
  class Conductor
    attr_reader :route, :wait, :conducting
    attr_accessor :stop

    def initialize(route, wait)
      @route = route
      @wait = wait
      @conducting = false
    end

    def conduct
      @stop = false
      loop do
        if stop
          @conducting = false
          break
        end
        @conducting = true
        gather_passengers.each do |passenger|
          escort(passenger) if verify(passenger)
        end
        sleep wait
      end
    end

    def verify(passenger)
      raise Ellington::NotImplementedError
    end

    def gather_passengers
      raise Ellington::NotImplementedError
    end

    def escort(passenger)
      passenger.lock
      route.head.board passenger
    end

  end
end
