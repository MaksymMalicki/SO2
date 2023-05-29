# This is a sample Python script.
from studentB import PlayersMove
from studentA import print_board, is_game_over, check_winner, check_full

if __name__ == '__main__':

    players_move = PlayersMove()
    players_move.initial_setup()
    if (players_move.board_size == 5):
        board = [['_', '_', '_', '_', '_'], ['_', '_', '_', '_', '_'], ['_', '_', '_', '_', '_'],
                 ['_', '_', '_', '_', '_'], ['_', '_', '_', '_', '_']]
    if (players_move.board_size == 3):
        board = [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']]
    while not is_game_over(board):
        print_board(board)
        players_move.player_move(board)
    if not check_full(board):
        print(f"The winner is player {'one' if check_winner(board) else 'two'}!")
    else:
        print("Draw!")
