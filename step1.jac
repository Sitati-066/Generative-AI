import random;

class Game {
    def init(self: Game, attempts: int) {
        self.attempts = attempts;
        self.got_it = False;
    }

    def play_game(self: Game) {
        while self.attempts > 0 and self.got_it is False {
            choices = ["rock", "paper", "scissors"];
            self.computer = random.choice(choices);

            player = input("Enter your choice (rock, paper, scissors): ").lower();
            if player not in choices {
                print("Wrong input, try again");
            } else {
                self.got_it = self.results(player);
            }
            self.attempts -= 1;
        }
    }

    def results(self: Game, player: str) {
        print(f"The computer chose {self.computer} You chose {player}");

        if self.computer == player {
            print("It's a draw");
            return False;
        } elif self.computer == "paper" and player == "scissors" {
            print("Congratulations. You won!!");
            return True;
        } elif self.computer == "rock" and player == "paper" {
            print("Congratulations. You won!!");
            return True;
        } elif self.computer == "scissors" and player == "rock" {
            print("Congratulations. You won!!");
            return True;
        } else {
            print("You lost, try again!");
            return False;
        }
    }
}

with entry {
    game1 = Game(3);
    game1.play_game();
}