require "option_parser"
require "phreak"
require "yaml"
require "json"
shard = YAML.parse(File.read("./shard.yml"))
list = JSON.parse(File.read("./src/utils/copypasta.json"))

module Crystalcoke
  Phreak.parse! do |cc|
    cc.banner = "A really stupid and dank CLI as a \"practical\" project for Crystal."

    # Help command
    cc.bind(word: "help", short_flag: 'h') do
      puts cc
    end

    # Does literally nothing
    cc.bind(word: "nothing", short_flag: 'n') do
    end

    cc.bind(word: "ping", short_flag: 'p') do
      puts "pong! 69ms"
    end

    cc.bind(word: "copypasta", short_flag: 'c') do
      OptionParser.parse do |e|
        e.banner = "f"

        e.on "--pasta", "i want to die" do
          puts "testing"
        end
      end
    end
  end
end
