# USER STORIES
# - List the items
# - Add an item
# - Import item (from Etsy)
# - Mark an item as bought/done
# - Unmark an item
# - Delete an item

# show menu
# - Initialize a list of items
# (=> ARRAY of HASHES)
# - iterate one by one => each_with_index
# - display/show on the screen
# - show the index + 1
# - show the name of item
# - check if done or not
# (=> if conditional / ternary operator)

# - prompt user if they want add item
# - get users choice (item)
# - false by default
# - push it to LIST

# Marking/Unmarking
# list items
# ask user to pick one item
# get user choice
# convert input to index
# validate if index exists
# "flip"/toggling done
# => done = !done

# ask user which item to delete
# gets user answer
# convert input to index
# validate if index exists
# (find_item_by_index)
# delete item from list => delete_at(index)

# ask user what item (name)
# go to etsy and fetch items (scraping)
# display results to user
# user pick an item from results
# add choice to list

require_relative 'view'
require_relative 'item'
require_relative 'actions'

LIST = [
  {
    name: "sockets",
    done: true
  },
  {
    name: "ruby book",
    done: false
  },
  {
    name: "macbook pro",
    done: true
  }
]

loop do
  display_menu
  choice = gets.chomp.upcase
  case choice
  when "A"
    display_items
  when "B"
    item = ask_for_item
    add_item(item)
  when "C"
    display_items
    index = ask_for_index(:mark)
    item = find_item(index)
    toggle_item(item)
  when "D"
    display_items
    index = ask_for_index(:delete)
    delete_item(index)
  when "E"
    import_item
  when "Q"
    break
  else
    puts "Please pick a valid option (A-E)!"
  end
end
puts "Goodbye!"
