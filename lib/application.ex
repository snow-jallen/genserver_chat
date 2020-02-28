defmodule ElixirChat.Application do
  # a supervisor module that gets called at runtime
  use Application

  def start(_type, _args) do
    children = [
      %{
        id: ElixirChat,
        start: {ElixirChat, :start_link, []}
      }
    ]
    opts = [strategy: :one_for_one, name: ElixirChat.Application]
    Supervisor.start_link(children, opts)
  end
end
