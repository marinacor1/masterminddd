require_relative 'mastermind'

class Instructions

  def instructions
    puts "\nMASTERMIND INSTRUCTIONS: \nMASTERMIND is a guessing game. \nYou are given unlimited chances to guess the correct order of four colors: Red(r), Green(g), Blue(b) and Yellow(y).  If you guess right, you win! If you guess wrong, you get to try again. After your first loss, you will get some clues on how close you are, including the number of letters that are correct and how many are in the correct position. If you get stuck and want to cheat your way out, type 'cheat' or 'c' for the secret code. At any time, you can type 'q' or 'quit' to get out of the game. After your first win, try to beat your best time!\n  ***Best of luck!***\n"

    puts "\nWould you like to (p)lay or (q)uit?"
    output = gets.chomp
      if output == 'p'|| output == 'play'
        m = Mastermind.new
        m.user_output
      elsif output == 'q' || output == 'quit'
        abort( "\nExiting game.")
      else
        puts "\nThis is not a valid option. Try again."
        puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
        output = gets.chomp
      end

  end

end
