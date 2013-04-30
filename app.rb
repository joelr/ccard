#1.8.7/1.9.x handling
require_relative 'card' if defined?(require_relative)
require 'card' unless defined?(require_relative)

if ARGV.length == 1 
  if File.exists?(ARGV[0])
    query_data = open(ARGV[0]).readlines.map{|m| m.strip}
  else
    query_data = [ARGV[0]]
  end
else
  query_data = open("sample_cards.txt").readlines.map{|m| m.strip}
end

query_data.each{|m| puts Card.new(m).output}
