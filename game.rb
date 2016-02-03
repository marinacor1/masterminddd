require 'pry'
class Game
  attr_reader :guesses, :output, :correct, :time
  attr_accessor :count, :positions

  def initialize
    colors = ["r", "g", "b", "y"]
    @correct = ["r", "g", "b", "y"]
    @time = Time.now
    # correct = []
    # correct = [colors[rand(0..3)], colors[rand(0..3)], colors[rand(0..3)], colors[rand(0..3)]]
    @count = 0
    @positions = []
    beginning_explanation
  end

  def beginning_explanation
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
    output = gets.chomp
      if output.length > 4
        "Your guess is too long. Try again."
      elsif output.length < 4
        "Your guess is too short. Try again."
      elsif output == 'q' || output == 'quit'
        print_stats
      elsif output == 'c' || output == 'cheat'
        secret_code
      else
        game_method(output)
      end
  end

    def game_method(guesses)
      @count +=1
      guesses = guesses.chars
      if guesses.eql?(correct)
        end_game
      else
        position_number(guesses)
      end
    end

    def position_number(guesses)
      index = 0
      # @correct = @correct.join("")
      while index <= @correct.length
        if guesses[index] == @correct[index]
          @positions << index
          index += 1
        else
          index +=1
        end
      end
      @postions
      correct_number(guesses)
    end

    def correct_number(guesses)
      @correct_num = 0
      guesses.each do |color|
        if correct.include?(color)
          @correct_num +=1
        end
      end
      @correct_num
      results(guesses)
    end

    def results(guesses)
      guesses_string = guesses.join("")
      @postions = @postions.to_s
      #failure: gives wrong number in correct_num (says 4 when should be 1)
      #gives blank for position_num which should be 1
      #count is correct
      #replays the 'i have a begginner sequence code'
      puts "'#{guesses_string.upcase}' has #{@correct_num} of the correct elements with #{@postions} in the correct postions \nYou've taken #{@count} guess"
      beginning_explanation
    end

    def end_game
      new_time = Time.now
      diff = new_time - @time
      if diff > 60
        minutes = (diff/60).to_i
        seconds = ((diff/60)/100) * 100
      else
        minutes = 0
        seconds = diff.to_i
      end
      @correct = @correct.join("")
      puts "Congratulation! You guessed the sequence '#{@correct.upcase}' in #{@count} guesses over #{minutes} minutes, #{seconds} seconds. \nDo you want to (p)lay again or (q)uit?"
      output = gets
        if output.chomp == 'p' || output.chomp == 'play'
          g = Game.new
          g.beginning_explanation
        elsif output.chomp == 'q' || output.chomp == 'quit'
          # exit_game
        else
          puts "This is not an option."
          puts "Do you want to (p)lay again or (q)uit?"
        end

    end


end
