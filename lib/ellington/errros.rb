module Ellington
  class InvalidStates < StandardError
  end

  class InvalidStateTransition < StandardError
  end

  class StateTransitionLimitExceeded < StandardError
  end

  class NotImplementedError < StandardError
  end

  class StationAlreadyAssigned < StandardError
  end

  class RouteAlreadyAssigned < StandardError
  end
end
