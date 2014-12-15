defmodule Chatdown.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: "/ws"

  channel "rooms", Chatdown.Rooms

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", Chatdown do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Chatdown do
  #   pipe_through :api
  # end
end
