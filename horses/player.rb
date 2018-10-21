def create_player
  puts "Enter player name:"
  print "> "
  name = gets.chomp
  { name: name, purse: 100}
end

def display_balance(balance)
  puts "You currently have $#{balance}"
end

def update_balance(balance, amount)
  balance + amount
end
