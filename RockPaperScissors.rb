def play_game(player_choice, computer_choice)
  if player_choice == computer_choice
    "Tie"
  elsif (player_choice == "rock" && computer_choice == "scissors") ||
    (player_choice == "scissors" && computer_choice == "paper") ||
    (player_choice == "paper" && computer_choice == "rock")
    "You win"
  else
    "You lose"
  end
end

if ARGV.length != 2
  puts("Invalid amount of args")
else
  player_choice = ARGV[0].downcase
  computer_choice = ARGV[1].downcase
  valid_choices = ["rock", "paper", "scissors"]

  if valid_choices.include?(player_choice) && valid_choices.include?(computer_choice)
    result = play_game(player_choice, computer_choice)
    puts result
  else
    puts "Invalid choices. Please choose from stone, scissors, or paper."
  end
end

