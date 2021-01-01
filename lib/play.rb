class Hangman

  def initialize
    @letters = ('a'..'z').to_a
    @word = words.sample
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

  def print_teaser 
    word_teaser = ""

    @word.first.size.times do
      word_teaser += "_ "
    end
    puts word_teaser
  end

  def make_guess
    puts "Enter a letter"
    guess = gets.chomp
  end

  def begin
    # ask user for a letter
    puts "New game started ... your word is #{ @word.first.size } characters long" 
    print_teaser

    puts "Clue: #{ @word.last }"


  end

end

game = Hangman.new 
game.begin