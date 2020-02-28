defmodule ElixirChatTest do
  use ExUnit.Case
  test "run ElxirChat with different name" do
    opts = [name: :TestChat1]
    ElixirChat.start_link(opts)

    ElixirChat.send_message("message 1", opts)

    expected_messages = ["message 1"]
    actual_messages = ElixirChat.get_messages(opts)

    assert actual_messages == expected_messages
  end

  test "run ElxirChat with default name" do
    opts = []
    ElixirChat.start_link(opts)

    ElixirChat.send_message("message 1", opts)

    expected_messages = ["message 1"]
    actual_messages = ElixirChat.get_messages(opts)

    assert actual_messages == expected_messages
  end

  test "run ElxirChat with default name #2" do
    opts = []
    {:ok, _} = ElixirChat.start_link(opts)

    ElixirChat.send_message("message 2", opts)

    expected_messages = ["message 2"]
    actual_messages = ElixirChat.get_messages(opts)

    assert actual_messages == expected_messages
  end

  test "run ElxirChat with default name #3" do
    opts = []
    {:ok, _} = ElixirChat.start_link(opts)

    ElixirChat.send_message("message 3", opts)

    expected_messages = ["message 3"]
    actual_messages = ElixirChat.get_messages(opts)

    assert actual_messages == expected_messages
  end

  test "run ElxirChat with default name #4" do
    opts = []
    {:ok, _} = ElixirChat.start_link(opts)
    |> IO.inspect(label: "what came back from start_link")

    ElixirChat.send_message("message 4", opts)

    expected_messages = ["message 4"]
    actual_messages = ElixirChat.get_messages(opts)

    assert actual_messages == expected_messages
  end
end
