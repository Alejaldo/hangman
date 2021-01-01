require "./lib/load.rb"

puts "Hello, let's play."
puts "Hidden word has #{@hidden_word_arr.size} letters"

6.times do
  puts "Enter a letter: "
  user_letter = gets.chomp.to_s.downcase!
  
    if @hidden_word_arr.include?(user_letter)
      puts "#{user_letter} is right"
    else 
      puts "#{user_letter} is wrong"
    end

end