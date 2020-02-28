defmodule ElixirChat.ChatSupervisor do
  def start_link(opts \\ []) do
    name = get_name(opts)
    empty_starting_state = {}
    DynamicSupervisor.start_link(__MODULE__, empty_starting_state, name: name)
  end

  defp get_name(opts) do
    Keyword.get(opts, :name, :ElixirChatDynamicSupervisor)
  end

  def init(_initial_state) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_child(chat_room_name, supervisor_opts \\ []) do
    child_spec = %{id: ElixirChat, start: {ElixirChat, :start_link, [name: chat_room_name]}}
    supervisor_name = get_name(supervisor_opts)
    DynamicSupervisor.start_child(supervisor_name, child_spec)
  end
end
