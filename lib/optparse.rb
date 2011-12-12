require 'optparse'
require 'rubygame'

options = {}

OptionParser.new do |opts|
  opts.on( '-t BPM', '--tempo BPM', /^[0-9]+/ ) do |bpm|
    options[:bpm] = bpm
  end
end.parse!

s = Rubygame::Sound.load('../sounds/tap_short.wav')

t = Thread.new do
  puts 'press Ctrl+C to stop'
  # main loop
  loop do
    s.play
    sleep( 60 / options[:bpm].to_f ) 
  end
end

begin 
  t.join
rescue Interrupt => e
  puts
  puts 'metronome off'
end
