import random;

walker RoShamBo {
    has player_choice: str;

    can start with `root entry;
    can play with game entry;
}

node game {
    has computer_choice: str = random.choice(("rock","paper","scissors"));
}

with entry:__main__ {
    root spawn RoShamBo("rock");
    root spawn RoShamBo("paper");
    root spawn RoShamBo("scissors");
}

impl RoShamBo.start {
    if not [root --> (`?game)] {
        next = root ++> game();
    } else {
        next = [root --> (`?game)];
    }
    visit next;
}

impl RoShamBo.play {
    print("Player chose: " + self.player_choice);
    print("Computer chose: " + here.computer_choice);

    if self.player_choice == here.computer_choice {
        print("It's a tie!");
    } elif (
        (self.player_choice == "rock" and here.computer_choice == "scissors") or
        (self.player_choice == "paper" and here.computer_choice == "rock") or
        (self.player_choice == "scissors" and here.computer_choice == "paper")
    ) {
        print("Player wins!");
    } else {
        print("Computer wins!");
    }
    disengage;
}
