class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  # Helper Methods
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    index = 9
    until valid_move?(index)
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end
      move(index, current_player)
      display_board
  end

  def turn_count
    counter = 0
    @board.each do |index|
      if index == "X" || index == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    result_val = nil
    dummy = WIN_COMBINATIONS.each do |win|
      (@board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X") ||
      (@board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O") ?
      result_val = win : nil
    end
    result_val
  end

  def full?
    !(@board.any?{|i| i == "" || i == " "})
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    win_val = won?
    if win_val == nil
      nil
    else
      @board[win_val[0]]
    end
  end

  def play
    until over?
      display_board
      puts "Where would you like to go?"
      input = gets.strip
      index = input_to_index(input)
      move(index, current_player)
    end

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end
