def print_board(array):
    for row in array:
        print(row)
    print()

def is_game_over(board):
    size = len(board)

    for row in board:
        if len(set(row)) == 1 and row[0] != '_':
            return True

    for col in range(size):
        if len(set([board[row][col] for row in range(size)])) == 1 and board[0][col] != '_':
            return True

    if len(set([board[i][i] for i in range(size)])) == 1 and board[0][0] != '_':
        return True

    if len(set([board[i][size - 1 - i] for i in range(size)])) == 1 and board[0][size - 1] != '_':
        return True

    return False

def check_winner(board):
    size = len(board)

    for row in board:
        if len(set(row)) == 1 and row[0] != '_':
            return row[0]

    for col in range(size):
        if len(set([board[row][col] for row in range(size)])) == 1 and board[0][col] != '_':
            return board[0][col]

    if len(set([board[i][i] for i in range(size)])) == 1 and board[0][0] != '_':
        return board[0][0]
    if len(set([board[i][size - 1 - i] for i in range(size)])) == 1 and board[0][size - 1] != '_':
        return board[0][size - 1]

    return None  