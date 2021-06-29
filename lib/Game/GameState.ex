defmodule GameState do
  defstruct players: nil,
            pairs: nil,
            deck: nil,
            pile: [],
            winner: nil,
            running: true,
            current_player: 0

  def new(players, pairs, deck) do
    indexed =
      players
      |> Enum.map(fn player -> player.id end)
      |> Enum.zip(players)
      |> Map.new

    %GameState{players: indexed, pairs: pairs, deck: deck, winner: nil}
  end

  def distribute_cards(game) do
    hands =
      game.deck
      |> Enum.take(12)
      |> Enum.chunk_every(3)

    players_with_hands =
      game.players
      |> Enum.zip(hands)
      |> Enum.map(fn {{_id, player}, cards} -> %{player | cards: cards} end)

    indexed_players =
      players_with_hands
      |> Enum.map(fn player -> player.id end)
      |> Enum.zip(players_with_hands)
      |> Map.new

    %{game | players: indexed_players}
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
