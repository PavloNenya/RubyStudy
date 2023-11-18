def create_spiral_matrix(n)
  matrix = Array.new(n) { Array.new(n) }
  num = 1
  row, col = (n / 2), (n / 2)
  matrix[row][col] = num
  direction_delta = n % 2 == 0 ? -1 : 1
  direction = 2
  steps = 1

  while num < n * n
    steps.times do
      case direction
      when 0
        col += 1
      when 1
        row -= 1
      when 2
        col -= 1
      when 3
        row += 1
      end

      num += 1
      return matrix if num > n*n
      matrix[row][col] = num
    end

    direction = (direction + direction_delta) % 4
    steps += 1 if direction % 2 == 0

  end

  matrix
end

print "Введіть розмір матриці: \n"
n = gets.chomp.to_i

spiral_matrix = create_spiral_matrix(n)

spiral_matrix.each do |row|
  row.each do |num|
    print "%-4d" % num
  end
  puts
end