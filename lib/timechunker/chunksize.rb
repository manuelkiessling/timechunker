module Timechunker
  class Chunksize

      attr_reader :size, :type

      def initialize(size, type)
        @size = size
        @type = type
      end

  end
end
