#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'json'
end
puts 'Gems installed and loaded!'

################## CSV #####################
puts "--- CSV read ---"

require 'csv'
CSV.read('./data/example.csv').each do |row|
  puts "row: #{ row }"
end

puts "--- CSV write ---"
csv_file = "tmp/export_#{ Time.now.strftime('%Y%m%d%H%M%S') }.csv"
CSV.open(csv_file, 'wb') do |row|
  row << ['i', 'am', 'header']
  row << [1,2,3]
end
File.foreach(csv_file) { |line| puts line }

################# File ####################
puts "--- File ---"

Dir.glob('tmp/*').each do |file|
  puts "delete: #{ file }"
  File.delete(file) if File.exists?(file)
end
# puts File.exists?('data/example.csv')
# File.rename("old-name.txt", "new-name.txt")
# File.size("users.txt")
# File.extname("users.txt")
# File.basename("/tmp/ebook.pdf") # => "ebook.pdf"
# File.dirname("/tmp/ebook.pdf")
