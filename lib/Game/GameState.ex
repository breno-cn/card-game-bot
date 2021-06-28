defmodule GameState do
  defstruct pairs: nil, deck: nil, winner: nil

  def new(pairs, deck) do
    %GameState{pairs: pairs, deck: deck, winner: nil}
  end
end
