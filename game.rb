require 'pry'
require 'colorize'
require_relative 'responses'

class Game
  include Responses
  attr_reader :guesses, :output, :correct, :minutes, :seconds, :initial_time, :difficulty_level

  def initialize
    @initial_time = Time.now
    @count = 0
  end

  def correct_sequence(difficulty_level)
    if difficulty_level == "beginner"
      colors = ["r", "g", "b", "y"]
      @correct ||= [colors[rand(0..3)], colors[rand(0..3)], colors[rand(0..3)], colors[rand(0..3)]]
    elsif difficulty_level == "intermediate"
      colors = ["r", "g", "b", "y", "p", "w"]
      @correct ||= [colors[rand(0..5)], colors[rand(0..5)], colors[rand(0..5)], colors[rand(0..5)], colors[rand(0..5)], colors[rand(0..5)]]
    else difficulty_level == "advanced"
      colors = ["r", "g", "b", "y", "p", "w", "s", "m"]
      @correct ||= [colors[rand(0..7)], colors[rand(0..7)], colors[rand(0..7)], colors[rand(0..7)], colors[rand(0..7)], colors[rand(0..7)], colors[rand(0..7)], colors[rand(0..7)]]
    end
  end

  def beg_game_start
    @difficulty_level = "beginner"
    correct_sequence("beginner")
    @max_length = 4
    beg_player_guess
    output = gets.chomp.downcase
    path_selector(output)
  end

  def int_game_start
    @difficulty_level = "intermediate"
    correct_sequence("intermediate")
    @max_length = 6
    int_player_guess
    output = gets.chomp.downcase
    path_selector(output)
  end

  def adv_game_start
    @difficulty_level = "advanced"
    correct_sequence("advanced")
    @max_length = 8
    adv_player_guess
    output = gets.chomp.downcase
    path_selector(output)
  end

  def beg_player_guess
    puts "\nI have generated a beginner sequence with four elements made up of:"
    print "(r)ed, ".colorize(:red)
    print "(g)reen, ".colorize(:green)
    print "(b)lue, ".colorize(:blue)
    print "and (y)ellow.".colorize(:yellow)
    puts "\nUse (q)uit at any time to end the game. You can press (c) to cheat. What's your guess?"
  end

  def int_player_guess
    puts "\nI have generated a intermediate sequence with six elements made up of:"
    print "(r)ed, ".colorize(:red)
    print "(g)reen, ".colorize(:green)
    print "(b)lue, ".colorize(:blue)
    print "(y)ellow, ".colorize(:yellow)
    print "(p)urple, ".colorize(:light_blue)
    print "and (w)white."
    puts "\nUse (q)uit at any time to end the game. You can press (c) to cheat. What's your guess?"
  end

  def adv_player_guess
    puts "\nI have generated an advanced sequence with eight elements made up of:"
    print "(r)ed, ".colorize(:red)
    print "(g)reen, ".colorize(:green)
    print "(b)lue, ".colorize(:blue)
    print "(y)ellow, ".colorize(:yellow)
    print "(p)urple, ".colorize(:light_blue)
    print "(w)white, "
    print "(s)almon, ".colorize(:light_red)
    print "and (m)int.".colorize(:light_green)
    puts "\nUse (q)uit at any time to end the game. You can press (c) to cheat. What's your guess?"
  end

  def difficulty_selector
    if difficulty_level == "beginner"
      beg_game_start
    elsif difficulty_level == "intermediate"
      int_game_start
    else difficulty_level == "advanced"
      adv_game_start
    end
  end

  def path_selector(output)
    answer = @correct.join("")
    if output == 'q' || output == 'quit'
      abort( "\nExiting game")
    elsif output == 'c' || output == 'cheat'
      puts "\n¯\\_(ツ)_/¯ Fine, you cheater. I will give you the answer. The secret code is: #{answer.upcase}.".colorize(:light_blue)
      difficulty_selector
    elsif output.length > @max_length
      puts "\nOh no! Your guess is too long. Try again."
      difficulty_selector
    elsif output.length < @max_length
      puts "\nOh no! Your guess is too short. Try again."
        difficulty_selector
    else
      guess_validator(output)
    end
  end

  def guess_validator(guesses)
    @count +=1
    correct = @correct.join("")
    if guesses.eql?(correct)
      end_game
    else
      results(guesses)
    end
  end

  def results(guesses)
    position_number(guesses)
    correct_number(guesses)
    feedback(guesses)
    difficulty_selector
  end

  def position_number(guesses)
    @position = 0
    guesses = guesses.split("")
    guesses.each_with_index do |guess, index|
      if guess == correct[index]
        @position += 1
      end
      @position
    end
  end

  def correct_number(guesses)
    guesses = guesses.split("")
    correct = @correct.dup
    correct_num = 0
    guesses.each do |letter|
      if correct.include?(letter)
        correct_num +=1
        correct.delete_at(correct.index(letter))
        correct
      end
    end
    @correct_num = correct_num
  end

  def stopwatch
    time_diff = (Time.now - initial_time).divmod(60)
    @minutes = time_diff[0]
    @seconds = time_diff[1].to_i
  end

  def end_game
    stopwatch
    congrats_message
    user_input
  end

  def user_input
    output = gets.chomp.downcase
      if output == 'p' || output == 'play'
        m = Mastermind.new
        m.user_output
      elsif output == 'q' || output == 'quit'
        abort( "\nExiting game.")
      else
        puts "\nThis is not an option. \nDo you want to (p)lay again or (q)uit?\n"
        output = gets
      end
  end



end
