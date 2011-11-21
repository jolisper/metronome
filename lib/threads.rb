require 'rubygame'

s = Rubygame::Sound.load('../sounds/agogo_high.wav')

t = Thread.new do
  loop do
    s.play
    sleep( 60 / ARGV[0].to_f ) 
  end
end

t.join
