defmodule Player do
  defstruct name: nil, id: nil, cards: nil

  def new(name, id) do
    %Player{name: name, id: id, cards: []}
  end
end
