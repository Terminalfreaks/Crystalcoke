require "phreak"
require "yaml"
require "json"
shard = YAML.parse(File.read("./shard.yml"))

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

    cc.bind(word: "ping", description: "Pings idk nasa its a stupid command") do
      puts "pong! 69ms bro"
    end

    cc.bind(word: "pickle", description: "Finds out the size of ur pickle") do |pickle|
      pickle.grab do |pickle, u|
        usize = Random.new.rand(18)
        puts "#{u}'s pickle is: 8#{"=" * usize}D"
      end

      pickle.missing_args do
        size = Random.new.rand(19)
        puts "Here is ur pickle: 8#{"=" * size}D"
      end
    end

    # Print commands when there is no commands or arguments
    cc.default do
      puts cc
    end
  end
end
