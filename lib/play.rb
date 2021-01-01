class Hangman

  def initialize
    @word = words.sample
    @lives = 6
    @word_teaser = ""

    @word.size.times do
      @word_teaser += "_ "
    end
  end

  def words
    File.open("5desk.txt").readlines.each do |line|
      clean_line = line.to_s.gsub(/[^a-zA-Z]/,"")
      clean_line.downcase! if clean_line.size.between?(5,12)
    end
  end

  def print_teaser last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|
      # replace blank values with guessed letter if matches in word
      if letter == '_' && @word[index] == last_guess
        new_teaser[index] = last_guess
      end

    end

    @word_teaser = new_teaser.join(' ')
  end

  def make_guess

    if @lives > 0
      puts "Enter a letter"
      guess = gets.chomp

      good_guess = @word.include? guess

      if guess == "exit"
        puts "Thank you for playing"
      elsif good_guess
        puts "Great match!"

        print_teaser guess

        if @word == @word_teaser.split.join
          puts "You are lucky Joe gdmn mzfk!"
        else
          make_guess
        end
      else
        @lives -= 1
        puts "Wrong! You have #{ @lives } lives left. Try again!"
        make_guess
      end

    else
      puts "Game over!"
    end

  end

  def begin
    # ask user for a letter
    puts "New game started ... your word is #{ @word.size } characters long" 
    puts "To exit game at any point type 'exit'"
    print_teaser
    puts
    make_guess
  end

end

game = Hangman.new 
game.begin