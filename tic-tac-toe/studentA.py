def print_board(array):
    for row in array:
        print(row)

array = [['X','_','_'],['X','_','_'],['X','_','_'],['_','_','_']]
print_board(array)

def is_game_over(board):
    for row in board:
        if len(set(row)) == 1 and row[0] != '_':
            return True

    for col in range(3):
        if len(set([board[row][col] for row in range(3)])) == 1 and board[0][col] != '_':
            return True

    if len(set([board[i][i] for i in range(3)])) == 1 and board[0][0] != '_':
        return True
    if len(set([board[i][2 - i] for i in range(3)])) == 1 and board[0][2] != '_':
        return True

    return False



print(is_game_over(array))
