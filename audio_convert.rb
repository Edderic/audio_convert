#! /usr/bin/ruby
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: audio_convert.rb [options]\n" +
    "  will batch-convert audio files in the current directory\n"

  opts.on("-m", "--m4a_to_caf", "Convert m4a to caf") do |m|
    options[:m4a_to_caf] = m
  end

  opts.on("-c", "--caf_to_m4a", "Convert caf to m4a") do |c|
    options[:caf_to_m4a] = c
  end

  opts.on("-r", "--remove_original", "Remove the originals (sources).") do |r|
    options[:remove_original] = r
  end
end.parse!

# TODO:
# - remove duplication. Extract method so that it is generalized for
# source, destination.
#
if options[:m4a_to_caf]
  m4a_entries =  Dir.entries(Dir.pwd).select { |entry| entry.match(/\.m4a/)}
  m4a_entries.each do |m4a_entry|
    caf_version = m4a_entry.sub('.m4a', '.caf')
    puts `afconvert -v -f 'caff' -d 'aac ' "#{m4a_entry}" -o "#{caf_version}"`

    puts `rm #{m4a_entry}` if options[:remove_original]
  end
elsif options[:caf_to_m4a]
  caf_entries =  Dir.entries(Dir.pwd).select { |entry| entry.match(/\.caf/)}
  caf_entries.each do |caf_entry|
    m4a_version = caf_entry.sub('.caf', '.m4a')
    puts `afconvert -v -f 'm4af' -d 'aac ' "#{caf_entry}" -o "#{m4a_version}"`

    puts `rm #{caf_entry}` if options[:remove_original]
  end
end
