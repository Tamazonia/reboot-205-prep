def calculator(first_number, second_number, operator)
  case operator
  when "+"
    first_number + second_number
  when "-"
    first_number - second_number
  when "*"
    first_number * second_number
  when "/"
    first_number / second_number
  end
end
