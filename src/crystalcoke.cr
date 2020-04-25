require "phreak"
require "yaml"
require "json"
shard = YAML.parse(File.read("./shard.yml"))
list = JSON.parse(File.read("./src/utils/copypasta.json"))

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
      pasta.bind(word: "help", description: "List all copypasta sub commands") do
        puts pasta
      end

      pasta.bind(word: "list", description: "Lists all the availble copypasta") do
        pastamenu = list["copypasta"].as_h
        pastalist = [] of String

        pastamenu.each do |key, value|
          pastalist << key
        end

        puts "Here is a list of the copypasta u can use.\nRun it with \"crystalcoke copypasta <pasta>.\""
        puts ""
        puts pastalist.join("\n")
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
