# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #TOP ROW
  [3,4,5], #MIDDLE ROW
  [6,7,8], #BOTTOM ROW
  [0,3,6], #LEFT COLUMN
  [1,4,7], #MIDDLE COLUMN
  [2,5,8], #RIGHT COLUMN
  [0,4,8], #LEFT-RIGHT DIAGONAL
  [2,4,6] #RIGHT-LEFT DIAGONAL
]

def won?(board)
  WIN_COMBINATIONS.each {|win_posibility|
    if (board[win_posibility[0]] == board[win_posibility[1]] && board[win_posibility[0]] == board[win_posibility[2]]) && board[win_posibility[0]] != " "
      return win_posibility
    end
  }
  return false
end

def full?(board)
  return !board.include?(" ")
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  return false
end

def over?(board)
  thing = won?(board)
  if draw?(board)
    return "draw"
  elsif thing
    return thing
  end
  return false
end

def winner(board)
   if over?(board)
     thing = over?(board)
     if thing == "draw"
       return nil
     end
     return board[thing[0]]
   end
   return nil
end
