defmodule Chatdown.Rooms do
  use Phoenix.Channel

  def join(socket, "public", message) do
    IO.puts "JOIN #{socket.channel}:#{socket.topic}"
    {:ok, socket}
  end

  def event(socket, "new:message", %{ "content" => content }) do
    broadcast socket, "new:message", %{ "content" => content }
    socket
  end
end
