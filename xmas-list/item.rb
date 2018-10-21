def add_item(name)
  LIST << {
    name: name,
    done: false
  }
end

def toggle_item(item)
  item[:done] = !item[:done]
end

def delete_item(index)
  LIST.delete_at(index)
end

def find_item(index)
  LIST[index]
end

def find_item_by_name(name)
  LIST.find do |item|
    item[:name.downcase] == name.downcase
  end
end

