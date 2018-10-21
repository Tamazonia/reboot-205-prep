# create/store a list of products
# HASH to store key/value pair
# product / prices

# initialize an empty cart
# HASH product / prices

# display the list of products
# LOOP
# ask user for product to add to cart
# validate if product exists
# add product to cart
# if user answer quit, go to checkout
# END LOOP

# Checkout
# display cart
# display total bill

STORE = {
  'kiwi' => 1.25,
  'banana' => 0.5,
  'mango' => 4,
  'asparagus' => 9
}

# CART = {
#  'kiwi' => { price: 1.25, quantity: 1 }
# }

CART = Hash.new { |h, k| h[k] = 0}

# Program starts
# display the list of products
puts  "--------------------"
puts " Welcome to Instacart "
puts "--------------------"
display_products(STORE)

loop do
  puts "Which item? (or 'quit' to checkout)"
  answer = gets.chomp
  until STORE.key?(answer) || answer == 'quit'
    puts "Sorry, we don't have #{answer} today.."
    puts "Which item? (or 'quit' to checkout)"
    answer = gets.chomp
  end
  break if answer == 'quit'
  add_product_to_cart(answer)
end

puts " -------BILL---------"
display_products(CART)
puts "TOTAL: #{total}"
puts "--------------------"


#### METHODS

def display_products(products)
  puts "In our store today:"
    products.each do |product, price|
      puts "#{product.capitalize}: #{price}€"
  end
end

#                        string
def add_product_to_cart(product)
  # creating a key with product => kiwi, ...
  #.    'kiwi' = STORE['kiwi'] => 1.25
  CART[product] = CART[product] + STORE[product]
end

def total
  # sum = 0
  # CART.each do |_product, price|
  #  sum += price
  #end
  # sum
  #.                      [key, value]
  CART.reduce(0) do |sum, product|
    sum += product[1]
  end
end
