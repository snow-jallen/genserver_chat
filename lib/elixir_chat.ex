defmodule ElixirChat do
  use GenServer

  @chat_genserver_name :ElixirChat

  def start_link(opts \\ []) do
    name = get_name(opts)
    initial_state = []
    GenServer.start_link(__MODULE__, initial_state, name: name)
  end

  def get_name(opts) do
    Keyword.get(opts, :name, @chat_genserver_name)
  end

  def send_message(message, opts \\ []) do
    name = get_name(opts)
    GenServer.cast(name, {:send_message, message})
  end

  def get_messages(opts \\ []) do
    name = get_name(opts)
    GenServer.call(name, :get_messages)
  end


  # ^  ^  ^  Above here runs on the client
  # ---------------------------------------------
  # V  V  V  Below here runs on the server

  # init runs on the server but blocks the calling process (start_link doesn't finish until after init is done)
  @impl true
  def init(initial_state) do
    {:ok, initial_state}
  end
git 

  @impl true
  def handle_cast({:send_message, message}, current_state) do
    new_state = [message | current_state]
    {:noreply, new_state}
  end

  @impl true
  def handle_call(:get_messages, _from, current_state) do
    new_state = ["[Messages read]" | current_state]
    {:reply, current_state, new_state}
  end
end
