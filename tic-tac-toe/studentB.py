import random


class PlayersMove:
    def __init__(self):
        # True - gracz 1, False - gracz 2
        self.current_player = None
        self.is_computer_playing = None
        self.board_size = 0

    def define_starter(self):
        while True:
            choice = input("Start first - type 'first', start second - type 'second', Coin flip - type 'flip'")
            if choice.lower() in ['first', 'second', 'flip']:
                if choice == 'first':
                    self.current_player = True
                elif choice == 'second':
                    self.current_player = False
                elif choice == 'flip':
                    self.current_player = random.choice([True, False])
                break
            else:
                print("Invalid choice. Please enter 'first', 'second', or 'flip'.")

    def play_against_computer(self):
        while True:
            choice = input("Play against computer - type 'yes', Play 2vs2 - type 'no'")
            if choice.lower() in ['yes', 'no']:
                if choice == 'yes':
                    self.is_computer_playing = True
                elif choice == 'no':
                    self.is_computer_playing = False
                break
            else:
                print("Invalid choice. Please enter 'yes', 'no'")

    def assign_board_size(self):
        while True:
            choice = input("Board size 3x3 - type '3', board size 5x5 - type '5'")
            if choice.lower() in ['3', '5']:
                if choice == '3':
                    self.board_size = 3
                elif choice == '5':
                    self.board_size = 5
                break
            else:
                print("Invalid choice. Please enter '3', '5'")

    def initial_setup(self):
        self.play_against_computer()
        self.define_starter()
        self.assign_board_size()

    def player_move(self, board):
        coordinates = (0,0)
        while True:
            if coordinates[0] > 3 or coordinates[1] > 3 or board[coordinates[0]][coordinates[1]] != '_':
                print('Podaj poprawne koordynaty')
            else:
                coordinates_input = input("Enter the coordinates (x, y): ")
                coordinates_input = coordinates_input.replace("(", "").replace(")", "")
                x, y = coordinates_input.split(",")
                x = int(x.strip())
                y = int(y.strip())
                coordinates = (x, y)
                break
        board[coordinates[0]][coordinates[1]] = 'X' if self.current_player else '0'
        self.current_player = not self.current_player

    def check_possible_win(self, array):
        n = len(array)
        player_sign = 'X' if self.current_player else '0'
        if array.count(player_sign) == n-1 and array.count('_') == 1:
            return True
        return False
    def make_computer_random_move(self):
        pass
    def make_computer_block_move(self):
        pass
    def computer_move(self, board):
        computer_block = False
        for row in board:
            computer_block = self.check_possible_win(row)
        for col in range(len(board[0])):
            column = [board[row][col] for row in range(len(board))]
            computer_block = self.check_possible_win(column)
        if computer_block:
            self.make_computer_block_move()
        else:
            self.make_computer_random_move()