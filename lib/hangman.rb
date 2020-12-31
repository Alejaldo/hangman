arr = File.open("5desk.txt").readlines.each do |line|
  line.strip
end
puts arr.sample