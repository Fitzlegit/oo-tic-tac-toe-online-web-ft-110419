require 'pry'

class TicTacToe

  attr_accessor :board

  def initialize()
    @board = Array.new(9, " ")
  end

      WIN_COMBINATIONS = [
      # Row win combinations
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      # Column win combinations
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      # Diagonal win combinations
      [0, 4, 8],
      [6, 4, 2]
      ]
   
   def play
    while !over? do
      turn
    end
    if won?
      return puts "Congratulations #{winner}!"
    elsif draw?
      return puts "Cat's Game!"
    end
   end
      
      
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "--------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "--------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(coord, token = "X")
    @board[coord] = token
  end

  def position_taken?(index)
    if @board[index].include?(" ")
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(move = nil)
    if move > 8 || move < 0
      return false
    elsif !position_taken?(move) == true
      true
    else
      false
    end
  end


  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    display_board
    puts "please input a position between 1-9"
    #input = gets.to_i
    index = input_to_index(gets)
    current_player #selects current player
    binding.pry

    if valid_move?(index) == true
      move(index)
      display_board
    else
      return "please input a valid position"
      #index = input_to_index(gets)
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
        return combination
      elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        return combination
      end
        false
    end
  end

   def full?
    @board.all? {|token| token == "X" || token == "O"}
   end

   def draw?
     !won? && @board.all?{|token| token == "X" || token == "O"}
   end

   def over?
    won? || draw?
   end

   def winner
     winner = 0
     if won?
       winner = won?
       @board[winner[0]]
     else
       nil
     end
   end
end