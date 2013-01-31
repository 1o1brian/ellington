require "delegate"

module Ellington
  class Line < SimpleDelegator
    attr_reader :name, :route

    def initialize(name)
      @name = name
      @formula = Hero::Formula[name]
      formula.steps.clear
      super []
    end

    def route=(value)
      raise Ellington::RouteAlreadyAssignedToLine unless route.nil?
      @route = value
    end

    def <<(station)
      station.line = self
      push station
      formula.add_step station.name, station
    end

    protected

    attr_reader :formula

  end
end
