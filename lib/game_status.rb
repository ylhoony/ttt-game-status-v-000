# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

# def won?(board)
#   WIN_COMBINATIONS.detect do |win_combination|
#     win_index_1 = win_combination[0]
#     win_index_2 = win_combination[1]
#     win_index_3 = win_combination[2]
#
#     position_1 = board[win_index_1]
#     position_2 = board[win_index_2]
#     position_3 = board[win_index_3]
#
#     if position_1 == "X" && position_2 =="X" && position_3 == "X" || position_1 == "O" && position_2 =="O" && position_3 == "O"
#       win_combination
#     else
#       false
#     end
#   end
# end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.none? do |e|
    e === " " || e === ""
  end
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  # true if the board has been won, is a draw, or is full.
  !!won?(board) || draw?(board) || full?(board)
end

# def winner(board)
#   game_status = won?(board)
#   if !!game_status 
#     el = game_status[0]
#     board[el][0]
#   end
# end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
