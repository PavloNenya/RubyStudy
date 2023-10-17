def roman_to_arabic(str)
  roman_numbers = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  result = 0
  prev_value = 0

  str.reverse.each_char do |char|
    value = roman_numbers[char]
    unless value
      puts "Invalid character: #{char}"
      return
    end

    value < prev_value ? result -= value : result += value
    prev_value = value
  end
  result
end

def arabic_to_roman(started_num)
  roman_numbers = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  unless started_num >= 1 && started_num < 4000
    puts "number #{started_num} is out of range"
    return
  end

  result = ""

  roman_numbers.keys.each do |value|
    while started_num >= value
      result += roman_numbers[value]
      started_num -= value
    end
  end

  result
end

unless ARGV.empty?
  if ARGV.length == 1
    str = ARGV[0].to_i
    roman = arabic_to_roman(str)
    puts "#{str} in roman = #{roman}"
    puts "#{roman} in arabic = #{roman_to_arabic(roman)}"
  else
    puts "Invalid value"
  end
  return
end
