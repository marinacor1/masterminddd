require_relative 'game'
require_relative 'instructions'

class Mastermind

  def initialize
    puts "Welcome to MASTERMIND"
    user_output
  end

  def user_output
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    output = gets.chomp
    if output == 'p'|| output == 'play'
      difficulty_levels
    elsif output == 'i'|| output == 'instructions'
      i = Instructions.new
      i.instructions
    elsif output == 'q' || output == 'quit'
       abort( "Exiting game.")
     else
       erroneous_response
     end
   end

   def difficulty_levels
      puts "What level would you like to play? (B)eginner with four colors, (I)ntermediate with six colors or (A)dvanced with 8 eight colors?"
      output = gets.chomp
      if output == 'B' || "b"
        g = Game.new
        g.beginner_game_start
      elsif output = "I" || "i"
        g = Game.new
        g.intermed_game_start
      elsif output = "A" || "a"
        g = Game.new
        g.adv_game_start
      end
   end

   def erroneous_response
      puts "This is not a valid option. Try again."
      user_output
   end
end

m= Mastermind.new
