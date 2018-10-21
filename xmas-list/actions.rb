require 'open-uri'
require 'nokogiri'

def import_item
  puts "What item do you want to search for?"
  query = gets.chomp
  items = fetch_items_from_etsy(query)

  items.each_with_index do |item, index|
    puts "#{index + 1} - #{item}"
  end

  puts "What item do you want to import?"
  index = gets.chomp.to_i - 1

  add_item(items[index])
end

def fetch_items_from_etsy(query)
  query.gsub!(" ", "+")
  url = "https://www.etsy.com/search?q=#{query}"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  items = []
  html_doc.search('.display-inline-block.listing-link').each do |element|
    items << element['title'].split(/[[:punct:]]/).first.strip
  end

  items.uniq.take(6)
end

