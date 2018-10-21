require 'date'
require 'yaml'

SSN_PATTERN = /^(?<gender>[12])\s?(?<yob>\d{2})\s?(?<mob>0[1-9]|1[0-2])\s?(?<department>\d{2}|2[AB])\s?\d{3}\s?\d{3}\s?(?<key>\d{2})$/
DEPARTMENTS = YAML.load_file('./data/french_departments.yml')

def french_ssn_info(ssn)
  return "The number is invalid" if ssn.empty?

  match_data = SSN_PATTERN.match(ssn)

  if match_data && valid_key?(ssn, match_data[:key])
    gender = gender(match_data[:gender])
    month = month(match_data[:mob])
    year = year(match_data[:yob])
    department = DEPARTMENTS[match_data[:department]]
    "a #{gender}, born in #{month}, #{year} in #{department}."
  else
    "The number is invalid"
  end
end

def gender(code)
  code == "1" ? "man" : "woman"
end

def month(code)
  Date::MONTHNAMES[code.to_i]
end

def year(code)
  "19" + code
end

def valid_key?(ssn, key)
  # A 2 digits key (46, equal
  # to the remainder of the division of
  # (97 - ssn_without_key) by 97.)
  ssn_without_key = ssn.gsub(' ', '')[0..-3].to_i
  remainder = (97 - ssn_without_key) % 97
  key.to_i == remainder
end

