require_relative 'welcome'
require_relative 'player'
require_relative 'horses'
require_relative 'race'

# Player begins with 100$
# if player wins 50$
# otherwise loses 10$
# player = { purse: 100 }

# list of a horses / race roster => Array
# ==== START LOOP ====
# display list of horses
# ask the user for the winning horse
# store user choice
# pick a random winner // run the race
# => sample (return a random item from Array)
# determine result
# print result (win or lost)
# determine if player has enough
# balance to continue
# ask user if they want to play again
# ===== END LOOP =====

HORSES = [
  "Jean",
  "Shadowfax",
  "Wyatt Earp",
  "Bronco",
  "Spirit",
  "John Wayne"
]

def puts_new_line(number = 1)
  number.times { puts }
end

puts_welcome
puts_new_line(3)
player = create_player
puts_new_line

loop do
  puts "Here's the race's roster:"
  display_horses
  puts_new_line
  display_balance(player[:purse])
  puts_new_line

  horse_index = ask_for_horse
  player_pick = find_horse(horse_index)

  winner = randomize_race_winner

  if player_won?(winner, player_pick)
    player[:purse] = update_balance(player[:purse], 50)
    print "Congratulations! You won!"
  else
    player[:purse] = update_balance(player[:purse], -10)
    print "Sorry, you lost!"
  end
  puts " #{winner} arrived first."
  puts_new_line

  if player[:purse] < 10
    puts "You have no more money! Game over!"
    break
  end

  puts "Do you want to race again?"
  print "> "
  answer = gets.chomp
  break if answer =~ /^n(o)?$/i
  puts_new_line(4)
end

puts "Goodbye!"



