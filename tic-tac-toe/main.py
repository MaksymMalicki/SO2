# This is a sample Python script.
from studentB import PlayersMove
from studentA import print_board, is_game_over


if __name__ == '__main__':
    board = [['_','_','_'],['_','_','_'],['_','_','_']]
    players_move = PlayersMove()
    while not is_game_over(board):
        print_board(board)
        

