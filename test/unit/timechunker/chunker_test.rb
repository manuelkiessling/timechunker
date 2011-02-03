require "test/unit"
require "timechunker"

class ChunkerTest < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_chunk_calculation_simple
    expected = [Time.local(2011, 1, 24, 13, 55, 0),
                Time.local(2011, 1, 24, 14, 0, 0),
                Time.local(2011, 1, 24, 14, 5, 0),
                Time.local(2011, 1, 24, 14, 10, 0)]

    timerange = Timechunker::Timerange.new(Time.local(2011, 1, 24, 13, 57, 0), Time.local(2011, 1, 24, 14, 10, 3))
    five_minutes = Timechunker::Chunksize.new(5, 'minutes')

    chunker = Timechunker::Chunker.new
    actual = chunker.get_chunks(timerange, five_minutes)

    assert_equal(expected, actual)

  end

  def test_chunk_calculation_singlechunk
    expected = [Time.local(2011, 1, 24, 13, 55, 0)]

    timerange = Timechunker::Timerange.new(Time.local(2011, 1, 24, 13, 57, 0), Time.local(2011, 1, 24, 13, 58, 3))
    five_minutes = Timechunker::Chunksize.new(5, 'minutes')

    chunker = Timechunker::Chunker.new
    actual = chunker.get_chunks(timerange, five_minutes)

    assert_equal(expected, actual)

  end

end
