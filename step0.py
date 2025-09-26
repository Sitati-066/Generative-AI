import random

got_it = False  # global variable

class Game:
    def __init__(self, attempts):
        self.attempts = attempts

    def play_game(self):
        global got_it
        while self.attempts > 0 and got_it is False:
            choices = ["rock", "paper", "scissors"]
            self.computer = random.choice(choices)

            player = input("Enter your choice (rock, paper, scissors): ").lower()
            if player not in choices:
                print("Wrong input, try again")
            else:
                got_it = self.results(player)

            self.attempts -= 1

    def results(self, player):
        print(f"The computer chose {self.computer}\nYou chose {player}")

        if self.computer == player:
            print("It's a draw")
            return False
        elif self.computer == "paper" and player == "scissors":
            print("Congratulations. You won!!")
            return True
        elif self.computer == "rock" and player == "paper":
            print("Congratulations. You won!!")
            return True
        elif self.computer == "scissors" and player == "rock":
            print("Congratulations. You won!!")
            return True
        else:
            print("You lost, try again!")
            return False
    
game1 = Game(3)
game1.play_game()
