defmodule Deck do
  def new do
    numbers = [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]
    suits = [:club, :diamond, :heart, :spade]

    for number <- numbers, suit <- suits do
      Card.new(number, suit)
    end
  end

  def shuffle([]), do: []

  def shuffle(deck) do
    index = :rand.uniform(length(deck)) - 1
    card = Enum.at(deck, index)
    new_deck = List.delete(deck, card)

    [card] ++ shuffle(new_deck)
  end
end
