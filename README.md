# Timechunker

## What it does

Timechunker allows you to split a time range into pieces of a defined size, like this:

	require "time"
	require "timechunker"
	
	timerange = Timechunker::Timerange.new(Time.parse("2011-02-03 18:04:02"),
	                                       Time.parse("2011-02-03 18:29:02"))
	
	five_minutes = Timechunker::Chunksize.new(5, 'minutes')
	
	chunker = Timechunker::Chunker.new
	chunker.get_chunks(timerange, five_minutes)

This will give you a list of all 5-minute chunks this timerange fits into

	=> [Thu Feb 03 18:00:00 +0100 2011,
	    Thu Feb 03 18:05:00 +0100 2011,
	    Thu Feb 03 18:10:00 +0100 2011,
	    Thu Feb 03 18:15:00 +0100 2011,
	    Thu Feb 03 18:20:00 +0100 2011,
	    Thu Feb 03 18:25:00 +0100 2011]

## Installation

	gem install timechunker

## TODO

Only works with 'minute' chunks, other chunk types need to be supported, too.
