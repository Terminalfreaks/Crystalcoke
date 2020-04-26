require "phreak"
require "yaml"
require "json"
shard = YAML.parse(File.read("./shard.yml"))

def zawarudo # :^)
  sleep 2
end

gaming = false
ask_for_succ = false

module Crystalcoke
  Phreak.parse! do |cc|
    cc.banner = "A really stupid and kinda dank CLI as a \"practical\" project for Crystal."

    cc.bind(short_flag: 'n', long_flag: "nothing",
      description: "Do absolutely nothing.") do
    end

    cc.bind(short_flag: 'h', long_flag: "help",
      description: "Shows all the available commands and flags.") do
      puts cc
    end

    cc.bind(short_flag: 'v', long_flag: "version",
      description: "Shows the version of Crystalcoke.") do
      puts "Crystalcoke #{shard["version"]}"
    end

    cc.bind(word: "ping", description: "Pings idk nasa its a stupid command") do
      puts "pong! 69ms bro"
    end

    cc.bind(word: "pickle", description: "Finds out the size of ur pickle") do |pickle|
      pickle.grab do |u, pickle|
        usize = Random.new.rand(18)
        puts "#{u}'s pickle is: 8#{"=" * usize}D"
      end

      pickle.missing_args do
        size = Random.new.rand(19)
        puts "Here is ur pickle: 8#{"=" * size}D"
      end
    end

    cc.bind(word: "watermellon", description: "saying watermellon avoids sneezes!!!1!") do
      # this is gonna look really bad
      puts "Rob > bro im gonna sneeze"
      zawarudo
      puts "Rob > aaaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAAaaa"
      zawarudo
      puts "Gary > just say watermellon bro"
      zawarudo
      puts "Rob > watermellon"
      sleep 5
      puts "Rob > ok"
    end

    cc.bind(word: "minecraft", description: "play some minecraft bro") do
      gaming = true
    end

    cc.bind(word: "wank", description: "hahahahahaha loser") do
      puts "fucking lonely ass gonna go get the lube hhhahhahahahahahhahahahahahhahahaha"
    end

    cc.bind(word: "succ", description: "ask for some succ") do
      ask_for_succ = true
    end

    cc.bind(word: "hack", description: "hack someone's router") do |hackz|
      hackz.grab do |a, person|
        ip = "#{Random.new.rand(256)}.#{Random.new.rand(256)}.#{Random.new.rand(256)}.#{Random.new.rand(256)}"
        array = ["Hacking #{person}'s computer...", "Getting their IP address...", "Address found! #{ip}"]
        Array(String).from_json("#{array}") do |e|
          puts e
          zawarudo
        end
        puts "now wonder to urself if this stupid generated ip works"
      end

      hackz.missing_args do
        puts hackz
      end
    end

    cc.bind(word: "thot", description: "help find a thot") do
      # "detection"
      detection = Random.new.rand(101) # random between 1-100 because the number u put isnt the max u get
      if detection > 50
        puts "fucking thot"
      else
        puts "aight ur ok"
      end
    end

    # Print commands when there is no commands or arguments
    cc.default do
      puts cc
    end
  end
end

while gaming
  puts "oh no looks like you found a creeper. what are u gonna do? write the number for ur option"
  puts "1. run away like a bitch\n2. fight like a boss\n3. kys"

  printf "> "
  next_line = gets || ""
  case next_line
  when "1"
    puts "\nhaha imagine running away pussy ass\nu still fall down a hole"
  when "2"
    puts "\nstupid u dont have armor. the creeper blows up and u die"
  when "3"
    puts "\nso u stand their for the creeper to blow up. congrats dumbass"
  end
  exit
end

while ask_for_succ
  puts "hi there person do u want some sUcC?????"

  printf "> "
  next_line = gets || ""

  case next_line
  when "yes"
    puts "\nno fuck you"
  when "no"
    puts "\nwhy did u ask stupid"
  end
  exit
end
