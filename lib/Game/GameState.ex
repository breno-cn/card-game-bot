defmodule GameState do
  defstruct players: nil,
            pairs: nil,
            deck: nil,
            pile: [],
            winner: nil,
            running: true,
            current_player: 0

  def new(players, pairs, deck) do
    %GameState{players: players, pairs: pairs, deck: deck, winner: nil}
  end

  def distribute_cards(game) do
    players_with_cards = game.deck
    |> Enum.take(12)
    |> Enum.chunk_every(3)
    |> Enum.map(fn chunk -> %{cards: chunk} end)
    |> Enum.zip(game.players)
    |> Enum.map(fn {%{cards: cards}, player} -> Map.put(player, :cards, cards) end)

    new_deck = Enum.drop(game.deck, 12)

    %{game | players: players_with_cards, deck: new_deck}
  end

  def debug() do
    player1 = Player.new("Breno", 1)
    player2 = Player.new("Caldeira", 2)
    player3 = Player.new("Algum", 3)
    player4 = Player.new("Nome", 4)

    pair1 = Pair.new([1, 2])
    pair2 = Pair.new([3, 4])

    deck = Deck.new()

    GameState.new([player1, player2, player3, player4], [pair1, pair2], deck)
  end
end
