require 'metronome/version'
require 'optparse'
require 'rubygame'

module Metronome
  
  module Command
    
    # Parse option and start metronome
    def self.run( args )
      options = {}

      OptionParser.new do |opts|
        opts.on( '-t BPM', '--tempo BPM', /^[0-9]+/ ) do |bpm|
          options[:bpm] = bpm
        end
      end.parse!( args )

      start( options[:bpm] )
    end

    # Start metronome
    def self.start( bpm )
      s = Rubygame::Sound.load( File.expand_path("../../sounds/tap_short.wav", __FILE__) )

      t = Thread.new do
        puts 'press Ctrl+C to stop'
        # main loop
        loop do
          s.play
          sleep( 60 / bpm.to_f ) 
        end
      end

      begin 
        t.join
      rescue Interrupt => e
        puts "\nmetronome off"
      end
    end

  end

end
