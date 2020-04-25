require "phreak"
require "yaml"
shard = YAML.parse(File.read("./shard.yml"))
list = YAML.parse(File.read("./src/utils/copypasta.yml"))

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

    cc.bind(word: "copypasta", description: "Get your favourite copypasta!!!") do |pasta|
      pasta.bind(word: "help") do
        puts pasta
      end

      pasta.bind(word: "list") do
        puts list["copypasta"].as_a.join("\n")
      end

      pasta.missing_args do
        puts pasta
      end
    end

    # Print commands when there is no commands or arguments
    cc.default do
      puts cc
    end
  end
end
