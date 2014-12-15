defmodule Chatdown.Rooms do
  use Phoenix.Channel

  def join(socket, "public", message) do
    IO.puts "JOIN #{socket.channel}:#{socket.topic}"
    {:ok, socket}
  end

  def event(socket, "new:message", message) do
    broadcast socket, "new:message", %{ "content" => message["content"] }
    socket
  end
end
