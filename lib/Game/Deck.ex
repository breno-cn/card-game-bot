defmodule Deck do
  def new do
    numbers = [:one, :two, :three, :four, :five, :six, :seve, :eight, :nine, :ten, :jack, :queen, :king]
    suits = [:club, :diamond, :heart, :spade]

    for number <- numbers, suit <- suits do
      Card.new(number, suit)
    end
  end
end
