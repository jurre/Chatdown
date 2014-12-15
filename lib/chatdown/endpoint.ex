defmodule Chatdown.Endpoint do
  use Phoenix.Endpoint, otp_app: :chatdown

  plug Plug.Static,
    at: "/", from: :chatdown

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_chatdown_key",
    signing_salt: "7wIYkMkZ",
    encryption_salt: "841/7Cfc"

  plug :router, Chatdown.Router
end
