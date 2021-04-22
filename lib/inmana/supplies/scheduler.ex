defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationNotification

  # GENSERVER CLIENT SIDE

  # The supervisor will call this function when started.
  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # GENSERVER SERVER SIDE

  # When the GenServer starts, this will be called.
  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  # Every message sended to the GenServer will call this function.
  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.send()

    schedule_notification()

    {:noreply, state}
  end

  # Our own implementation of a cronjob with pure elixir!
  defp schedule_notification do
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
