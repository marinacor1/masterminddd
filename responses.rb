require 'colorize'
module Responses

  def beg_player_guess
    puts "\nI have generated a beginner sequence with four elements.  Type your guess below.  Your options are made up of:"
    print "(r)ed, ".colorize(:red)
    print "(g)reen, ".colorize(:green)
    print "(b)lue, ".colorize(:blue)
    print "and (y)ellow.".colorize(:yellow)
    puts "\nUse (q)uit at any time to end the game. You can press (c) to cheat and get the secret code. What's your guess?"
  end

  def int_player_guess
    puts "\nI have generated a intermediate sequence with six elements.  Type your guess below. Your options are made up of:"
    print "(r)ed, ".colorize(:red)
    print "(g)reen, ".colorize(:green)
    print "(b)lue, ".colorize(:blue)
    print "(y)ellow, ".colorize(:yellow)
    print "(p)urple, ".colorize(:light_blue)
    print "and (w)white."
    puts "\nUse (q)uit at any time to end the game. You can press (c) to cheat and get the secret code. What's your guess?"
  end

  def adv_player_guess
    puts "\nI have generated an advanced sequence with eight elements.  Type your guess below. Your options are made up of:"
    print "(r)ed, ".colorize(:red)
    print "(g)reen, ".colorize(:green)
    print "(b)lue, ".colorize(:blue)
    print "(y)ellow, ".colorize(:yellow)
    print "(p)urple, ".colorize(:light_blue)
    print "(w)white, "
    print "(s)almon, ".colorize(:light_red)
    print "and (m)int.".colorize(:light_green)
    puts "\nUse (q)uit at any time to end the game. You can press (c) to cheat and get the secret code. What's your guess?"
  end

  def cheat_response
    puts "\n¯\\_(ツ)_/¯ Fine, you cheater. I will give you the answer. The secret code is:".colorize(:light_blue) "  #{answer.upcase}. ".colorize(:yellow)
  end

  def too_long_response
    puts "\nOh no! Your guess is too long. Try again."
  end

  def too_short_response
    puts "\nOh no! Your guess is too short. Try again."
  end

  def feedback(guesses)
    puts "\n'#{guesses.upcase}' has #{@correct_num} of the correct elements with #{(@position.to_s)} in the correct position(s). \nYou've taken #{@count} guess(es)."
  end

  def congrats_message
    correct = @correct.join("")
    def puts "\nCongratulations! You guessed the sequence '#{correct.upcase}' in #{@count} guesses over" "#{@minutes} minutes,".colorize(.yellow)  "#{@seconds} seconds.".colorize(:yellow) "\nDo you want to (p)lay again or (q)uit?"(var)

    end
  end

  def error_message
    puts "\nThis is not an option. \nDo you want to (p)lay again or (q)uit?\n"
  end

  def difficulty_message
    puts "\nWhat level would you like to play?"
    print "(B)eginner with four colors,".colorize(:blue)
    print "(I)ntermediate with six colors".colorize(:yellow)
    print " or (A)dvanced with eight colors?\n".colorize(:green)
  end

  def initial_options
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
  end

end
