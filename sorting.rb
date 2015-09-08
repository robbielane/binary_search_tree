require_relative 'lib/bst'

tree = Bst.new

File.open("input.txt").readlines.each do |line|
  tree.insert(line.chomp.to_i)
end

File.open("output.txt", "w") do |file|
    tree.sort.each { |value| file.write(value.to_s + "\n") }
  end
