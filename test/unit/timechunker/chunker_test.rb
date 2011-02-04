require "test/unit"
require "timechunker"

class ChunkerTest < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_chunk_calculation_default
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

  def test_chunk_calculation_other
    expected = [Time.local(2011, 1, 24, 14, 0, 0),
                Time.local(2011, 1, 24, 14, 5, 0),
                Time.local(2011, 1, 24, 14, 10, 0),
                Time.local(2011, 1, 24, 14, 15, 0),
                Time.local(2011, 1, 24, 14, 20, 0),
                Time.local(2011, 1, 24, 14, 25, 0)]

    timerange = Timechunker::Timerange.new(Time.local(2011, 1, 24, 14, 4, 0), Time.local(2011, 1, 24, 14, 26, 3))
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

  def test_chunk_calculation_singlechunk_boundary
    expected = [Time.local(2011, 1, 24, 13, 55, 0)]

    timerange = Timechunker::Timerange.new(Time.local(2011, 1, 24, 13, 55, 0), Time.local(2011, 1, 24, 13, 59, 59))
    five_minutes = Timechunker::Chunksize.new(5, 'minutes')

    chunker = Timechunker::Chunker.new
    actual = chunker.get_chunks(timerange, five_minutes)

    assert_equal(expected, actual)
  end

  def test_chunk_calculation_twochunks_boundary
    expected = [Time.local(2011, 1, 24, 13, 55, 0),
                Time.local(2011, 1, 24, 14, 0, 0)]

    timerange = Timechunker::Timerange.new(Time.local(2011, 1, 24, 13, 55, 0), Time.local(2011, 1, 24, 14, 0, 0))
    five_minutes = Timechunker::Chunksize.new(5, 'minutes')

    chunker = Timechunker::Chunker.new
    actual = chunker.get_chunks(timerange, five_minutes)

    assert_equal(expected, actual)
  end

  def test_chunk_calculation_fullhour
    expected = [Time.local(2011, 1, 24, 13, 0, 0),
                Time.local(2011, 1, 24, 13, 20, 0),
                Time.local(2011, 1, 24, 13, 40, 0),
                Time.local(2011, 1, 24, 14, 0, 0)]

    timerange = Timechunker::Timerange.new(Time.local(2011, 1, 24, 13, 0, 0), Time.local(2011, 1, 24, 14, 0, 0))
    twenty_minutes = Timechunker::Chunksize.new(20, 'minutes')

    chunker = Timechunker::Chunker.new
    actual = chunker.get_chunks(timerange, twenty_minutes)

    assert_equal(expected, actual)
  end

  def test_chunk_calculation_uneven
    expected = [Time.local(2011, 1, 24, 13, 0, 0),
                Time.local(2011, 1, 24, 13, 21, 0),
                Time.local(2011, 1, 24, 13, 42, 0),
                Time.local(2011, 1, 24, 14, 3, 0),
                Time.local(2011, 1, 24, 14, 24, 0)]

    timerange = Timechunker::Timerange.new(Time.local(2011, 1, 24, 13, 0, 0), Time.local(2011, 1, 24, 14, 30, 0))
    twentyone_minutes = Timechunker::Chunksize.new(21, 'minutes')

    chunker = Timechunker::Chunker.new
    actual = chunker.get_chunks(timerange, twentyone_minutes)

    assert_equal(expected, actual)
  end

end
