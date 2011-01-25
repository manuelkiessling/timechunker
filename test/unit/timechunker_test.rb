require "test/unit"
require "../../lib/time_range.rb"
require "../../lib/chunk_size.rb"
require "../../lib/time_chunker.rb"

class TimeChunkerTest < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_chunk_calculation
    expected = [Time.local(2011, 1, 24, 13, 55, 0),
                Time.local(2011, 1, 24, 14, 0, 0),
                Time.local(2011, 1, 24, 14, 5, 0),
                Time.local(2011, 1, 24, 14, 10, 0)]

    time_range = TimeRange.new(Time.local(2011, 1, 24, 13, 57, 0), Time.local(2011, 1, 24, 14, 10, 3))
    five_minutes = ChunkSize.new(5, 'minutes')

    time_chunker = TimeChunker.new
    actual = time_chunker.get_chunks(time_range, five_minutes)

    assert_equal(expected, actual)

  end

end
