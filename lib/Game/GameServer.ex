defmodule GameServer do
  use GenServer

  # Client API
  def start_link(game) do
    GenServer.start_link(__MODULE__, game)
  end

  def start(server) do
    GenServer.call(server, :start)
  end

  def get_state(server) do
    GenServer.call(server, :state)
  end

  # Server "backend"
  @impl true
  def init(game) do
    {:ok, game}
  end

  @impl true
  def handle_call(:start, _from, game) do
    shuffled = Deck.shuffle(game.deck)
    started = %{game | deck: shuffled, current_player: 0}

    {:reply, :ok, started}
  end

  @impl true
  def handle_call(:state, _from, game) do
    {:reply, game, game}
  end
end
