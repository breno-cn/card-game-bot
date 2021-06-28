defmodule Player do
  defstruct name: nil, id: nil, cards: nil

  def new(name, id, cards) do
    %Player{name: name, id: id, cards: cards}
  end
end
