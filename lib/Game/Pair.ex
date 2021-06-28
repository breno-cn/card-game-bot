defmodule Pair do
  defstruct player1: nil, player2: nil, points: nil

  def new(player1, player2) do
    %Pair{player1: player1, player2: player2, points: 0}
  end
end
