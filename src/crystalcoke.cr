require "phreak"
require "yaml"
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

    # Print commands when there is no commands or arguments
    cc.default do
      puts cc
    end
  end
end
