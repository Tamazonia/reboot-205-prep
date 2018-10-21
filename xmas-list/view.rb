def display_items
  LIST.each_with_index do |item, index|
    # if item[:done]
    #   puts "#{index + 1} - [X] #{item[:name]}"
    # else
    #   puts "#{index + 1} - [ ] #{item[:name]}"
    # end
    puts "#{index + 1} - [#{item[:done] ? 'X' : ' '}] #{item[:name]}"
  end
end

def ask_for_item
  puts "Type item to add:"
  print "> "
  gets.chomp
end

def ask_for_index(action)
  puts "Which item do you want to #{action}? (1-#{LIST.length})"
  print "> "
  index = gets.chomp.to_i - 1

  until index.between?(0, LIST.length - 1)
    puts "Please pick a valid option (1-#{LIST.length}):"
    print "> "
    index = gets.chomp.to_i - 1
  end

  index
end

def display_menu
  puts "\n\n"
  puts "(A) List items"
  puts "(B) Add item"
  puts "(C) Mark/Unmark item"
  puts "(D) Delete item"
  puts "(E) Import item"
  puts "(Q) Quit"
  puts
  puts "Choose an option [A-E]:"
  print "> "
end
