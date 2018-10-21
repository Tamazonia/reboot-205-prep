def randomize_race_winner
  HORSES.sample
end

def player_won?(winner, choice)
  winner == choice
end
