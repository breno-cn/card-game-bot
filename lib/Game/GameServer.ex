defmodule GameServer do
  use GenServer

  # Client API
  def start_link(game) do
    GenServer.start_link(__MODULE__, game)
  end

  def testing(server) do
    GenServer.call(server, :test)
  end

  # Server "backend"
  @impl true
  def init(game) do
    {:ok, game}
  end

  @impl true
  def handle_call(:test, _from, game) do
    # IO.inspect(game)
    {:reply, :testing, game}
  end
end
