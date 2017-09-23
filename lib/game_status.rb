require 'pry'
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
  [2,4,6]
]

def won?(board)
  array = false
  WIN_COMBINATIONS.each do |combo|
    array << combo if position_taken?(board, combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
  end
  array
end

def full?(board)
  board.all? do |cell|
    cell == "X" or cell == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) or won?(board)
end

def winner(board)
  if won?(board) && board[won?(board)[0]] == "X"
    "X"
  elsif won?(board) && board[won?(board)[0]] == "O"
    "O"
  end
end
