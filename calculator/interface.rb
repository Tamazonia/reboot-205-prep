require_relative 'calculator'

def welcome_user
  puts "Hello, welcome to SimpleCalculator!"
  puts "\n\n\n"
end

def ask_for_number(ordinal)
  puts "Enter #{ordinal} number:"
  print "> "
end

def get_number
  answer = gets.chomp
  until answer =~ /\A\d+\Z/
    puts "Please pick a valid number:"
    print "> "
    answer = gets.chomp
  end
  answer.to_i
end

def ask_for_operator
  puts "Choose operation [+][-][*][/]:"
  print "> "
end

def get_operator
  answer = gets.chomp
  until answer =~ /\A[\+-\/\*]\Z/
    puts "Please pick a valid operation [+][-][*][/]:"
    print "> "
    answer = gets.chomp
  end
  answer
end

welcome_user
loop do
  ask_for_number(:first)
  first_number = get_number
  ask_for_number(:second)
  second_number = get_number
  ask_for_operator
  operator = get_operator
  result = calculator(first_number, second_number, operator)
  puts "Result: #{result}"
  puts "\n"
  puts "Do you want to continue? (type 'quit' to exit)"
  choice = gets.chomp
  break if choice == "quit"
end

