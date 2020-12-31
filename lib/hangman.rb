arr = File.open("5desk.txt").readlines.each do |line|
  clean_line = line.to_s.gsub(/[^a-zA-Z]/,"")
  clean_line.downcase! if clean_line.size.between?(5,12)
end

puts arr.sample