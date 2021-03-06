#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'json'
end
puts 'Gems installed and loaded!'

################## CSV #####################
# https://ruby-doc.org/stdlib-3.1.0/libdoc/csv/rdoc/CSV.html
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
# https://ruby-doc.org/core-3.1.0/File.html
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

########## Plain net/http ################
# https://ruby-doc.org/stdlib-3.1.0/libdoc/net/http/rdoc/Net/HTTP.html
# examples: https://jhawthorn.github.io/curl-to-ruby/
puts "--- net/http ---"

require 'net/http'
require 'uri'

uri = URI.parse('https://raw.githubusercontent.com/exsemt/ruby-script-template/master/data/example.json')
response = Net::HTTP.get_response(uri)

puts "response code: #{response.code}"
puts "response body: #{response.body}"
puts 'JSON.parse'
JSON.parse(response.body).each { |line| puts line }
