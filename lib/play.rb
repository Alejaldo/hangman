class Hangman

  def initialize
    @letters = ('a'..'z').to_a
    @word = words.sample
    @lives = 7
    @correct_guesses = []
    @word_teaser = ""

    @word.first.size.times do
      word_teaser += "_ "
    end
  end

  def words
    [
      ["cricket", "first"],
      ["jogging", "second"],
      ["celebrate", "third"],
      ["continent", "fourth"],
      ["exotic", "fifth"],
    ]
  end

  def print_teaser last_guess
    word_teaser = ""

    update_teaser

    puts word_teaser
  end

  def make_guess
    if @lives > 0
      puts "Enter a letter"
      guess = gets.chomp

      good_guess = @word.first.include? guess

      if good_guess
        puts "Great match!"

        @correct_guesses << guess

        # remove correct guess from alphabet
        @letters.delete guess

        print_teaser guess
        make_guess
      else
        @lives -= 1
        puts "Wrong! You have #{ @lives }. Try again!"
        make_guess
      end
    else
      puts "Game over!"
    end
  end

  def begin
    # ask user for a letter
    puts "New game started ... your word is #{ @word.first.size } characters long" 
    print_teaser

    puts "Clue: #{ @word.last }"

    make_guess
  end

end

game = Hangman.new 
game.begin