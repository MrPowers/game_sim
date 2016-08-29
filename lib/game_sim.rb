require 'csv'
require 'pry'

module GameSim; class Simulate

  attr_reader :num_players

  def initialize(num_players = 4)
    @num_players = num_players
  end

  def deal_black_card
    black_card_data.sample
  end

  def deal_white_cards
    cards = white_card_data.shuffle
    result = {}
    start_index = 0
    num_players.times do |p|
      result[p] = cards[start_index, 10]
      start_index += 10
    end
    result
  end

  def white_card_data
    path = File.join(root, "data", "white_cards.csv")
    col_data = []
    CSV.foreach(path) {|row| col_data << row[0]}
    col_data
  end

  def black_card_data
    path = File.join(root, "data", "black_cards.csv")
    col_data = []
    CSV.foreach(path) {|row| col_data << row[0]}
    col_data
  end

  def root
    File.expand_path("../", File.dirname(__FILE__))
  end

end; end

s = GameSim::Simulate.new
binding.pry

