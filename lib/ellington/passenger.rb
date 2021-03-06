require "observer"

module Ellington
  class Passenger < SimpleDelegator
    include Observable
    attr_accessor :context
    attr_reader :states, :ticket

    def initialize(context, ticket, states)
      ticket.passenger = self
      ticket.freeze unless ticket.frozen?
      states.lock unless states.frozen?
      @context = context
      @ticket = ticket
      @states = states
      super context
    end

    def lock
      return context.lock if context.respond_to?(:lock)
      @locked = true
    end

    def unlock
      return context.unlock if context.respond_to?(:unlock)
      @locked = false
    end

    def locked?
      return context.locked? if context.respond_to?(:"locked?")
      @locked
    end

    def current_state
      return context.current_state if context.respond_to?(:current_state)
      @current_state
    end

    def current_state=(value)
      return context.current_state=(value) if context.respond_to?(:"current_state=")
      @current_state = value
    end

    def transition_to(new_state)
      if !locked?
        message = "Cannot transition an unlocked #{self.class.name}'s state"
        raise Ellington::InvalidStateTransition.new(message)
      end

      if !states.can_transition?(current_state => new_state)
        message = "Cannot transition #{self.class.name} from:#{current_state} to:#{new_state}"
        raise Ellington::InvalidStateTransition.new(message)
      end

      old_state = current_state

      if context.respond_to?(:transition_to)
        return_value = context.transition_to(new_state) 
      else
        self.current_state = new_state
      end

      changed
      notify_observers TransitionInfo.new(self, old_state, new_state)
      return_value || new_state
    end

  end
end
