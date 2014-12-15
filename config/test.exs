use Mix.Config

config :chatdown, Chatdown.Endpoint,
  http: [port: System.get_env("PORT") || 4001]
