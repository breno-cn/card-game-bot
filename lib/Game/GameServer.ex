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

  def get_player_cards(server, player_id) do
    GenServer.call(server, {:get_cards, player_id})
  end

  # Server "backend"
  @impl true
  def init(game) do
    {:ok, game}
  end

  @impl true
  def handle_call(:start, _from, game) do
    shuffled = Deck.shuffle(game.deck)
    started = GameState.distribute_cards(%{game | deck: shuffled})

    {:reply, :ok, started}
  end

  @impl true
  def handle_call(:state, _from, game) do
    {:reply, game, game}
  end

  def handle_call({:get_cards, player_id}, _from, game) do
    # player = Enum.find(game.players, fn {id, _player} -> id == player_id end)
    player =
      game.players
      |> Enum.find(fn player -> player.id == player_id end)

    {:reply, player.cards, game}
  end
end
