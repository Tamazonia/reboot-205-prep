def display_horses
  HORSES.each_with_index do |horse, index|
    puts "#{index + 1} - #{horse}"
  end
  puts_new_line
end

def ask_for_horse
  puts "Pick a horse (1-#{HORSES.size})"
  print "> "
  gets.chomp.to_i - 1
end

def find_horse(index)
  HORSES[index]
end
