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
            if choice.lower() in ['first', 'second', 'coin_flip']:
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
    def get_player_move(self):
        return self.current_player

    def player_move(self, board):
        coordinates = (0,0)
        while True:
            if coordinates[0] > 3 or coordinates[1] > 3 or board[coordinates] != '_':
                print('Podaj poprawne koordynaty')
            else:
                coordinates_input = input("Enter the coordinates (x, y): ")
                coordinates_input = coordinates_input.replace("(", "").replace(")", "")  # Remove parentheses
                x, y = coordinates_input.split(",")  # Split the input at the comma
                x = int(x.strip())  # Remove whitespace and convert to integer
                y = int(y.strip())  # Remove whitespace and convert to integer
                coordinates = (x, y)
                break
        board[coordinates] = 'X' if self.current_player else '0'
        self.current_player = not self.current_player

    def ai_move(self):
        pass
