defmodule Pair do
  defstruct player_ids: [], points: nil

  def new(player_ids) do
    %Pair{player_ids: player_ids, points: 0}
  end
end
