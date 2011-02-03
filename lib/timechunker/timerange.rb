module Timechunker
  class Timerange

    attr_reader :start_time, :end_time

    def initialize(start_time, end_time)
      @start_time = start_time
      @end_time = end_time
    end

  end
end
