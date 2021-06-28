defmodule Card do
  defstruct number: :atom, suit: :atom

  def new(number, suit) do
    %Card{number: number, suit: suit}
  end
end
