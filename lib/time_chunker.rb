class TimeChunker

  # 2010-12-24 06:30:17

  def get_chunks(time_range, chunk_size)
    if chunk_size.type == 'minutes'
      number_of_chunks = ((time_range.end_time - time_range.start_time) / 60 / chunk_size.size).round.to_i
      number_of_chunks = number_of_chunks + 1

      first_chunk = find_chunk(time_range.start_time, chunk_size)
      
      chunks = []
      number_of_chunks.times do |i|
        chunks << first_chunk + (i * 60 * chunk_size.size)
      end
      
      chunks

    end
  end


  private
  
  def find_chunk(time, chunk_size)
    if chunk_size.type == 'minutes'
      first_chunk = Time.local(time.year,
                               time.month,
                               time.day,
                               time.hour,
                               time.min / chunk_size.size * chunk_size.size,
                               0)
      end
 end

end
