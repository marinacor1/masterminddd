require_relative 'game'
require_relative 'instructions'


class Mastermind

  def initialize
    puts "Welcome to MASTERMIND"
  end

  def user_output
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit the game?\n"
    output = gets.chomp
    if output == 'p'|| output == 'play'
      difficulty_levels
    elsif output == 'i'|| output == 'instructions'
      i = Instructions.new
      i.instructions
    elsif output == 'q' || output == 'quit'
       abort( "\nExiting game.")
     else
       erroneous_response
     end
   end

   def difficulty_levels
      puts "\nWhat level would you like to play?"
      print "(B)eginner with four colors,".colorize(:blue)
      print "(I)ntermediate with six colors".colorize(:yellow)
      print " or (A)dvanced with 8 eight colors?\n".colorize(:green)
      output = gets.chomp
      if output == 'B' || output == "b"
        g = Game.new
        g.game_start(:beginner)
      elsif output == "I" || output == "i"
        g = Game.new
        g.game_start(:intermediate)
      elsif output == "A" || output == "a"
        g = Game.new
        g.game_start(:advanced)
      end
   end

   def erroneous_response
      puts "\nThis is not a valid option. Try again."
      user_output
   end
end

m= Mastermind.new
m.user_output
