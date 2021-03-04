class TicTacToe 

   def initialize(board = nil) 
    @board = board || Array.new(9, " ")
  end

   WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

   def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

   def move(location, character = "X" || "O")
    @board[location.to_i - 1] = character
  end

   def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true
    else
      false
    end 
  end

   def valid_move?(position)
    position = position.to_i - 1
    if position.between?(0,8) && !position_taken?(position)
      true
    else
      false
    end
  end
  def input_to_index(input)
    input.to_i - 1
  end
  
    def input_to_index(user_input)
    user_input.to_i - 1
  end
  
   def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

   def turn_count
    counter = 0
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    tally = turn_count
    tally % 2 == 0  ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |el|
      pos1 = @board[el[0]]
      pos2 = @board[el[1]]
      pos3 = @board[el[2]]
      if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
        return el
      end
    end
    return false
  end
  
   def full?
    @board.all? do |el|
      position_taken?(@board.index(el))
    end
  end

  def draw?
    result_won = won?
    if full? && result_won == false
      true
    else
      false
    end
  end

  def over?
    won? || draw? ? true : false
  end

   def winner
    if won?
      arr = won?
      winning = @board[arr[0]]
      return winning
    else
      return nil
    end
  end

   def play
    until over?
      turn
    end
     if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
 end  