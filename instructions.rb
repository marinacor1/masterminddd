class Instructions

  def instructions
    puts "\nMASTERMIND INSTRUCTIONS: \n\nMASTERMIND is a guessing game. \nYou are given unlimited chances to guess the correct order of colors.  Depending on your level, the number of colors changes.  \nIf you guess right, you win! If you guess wrong, you get to try again. After your first loss, you will get some clues on how close you are, including the number of letters that are correct and how many are in the correct position. If you get stuck and want to cheat your way out, type 'cheat' or 'c' for the secret code. At any time, you can type 'q' or 'quit' to get out of the game. After your first win, try to beat your best time!\n  ***Best of luck!***\n"

    puts "\nType anything and return to exit out."
    output = gets.chomp
      if output
        abort( "\nExiting game.")
      end

  end

end
