# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gen_schemas,
  ecto_repos: [GenSchemas.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :gen_schemas, GenSchemasWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BDq8sC2/3n/mmDt515THFw9agqjVe4+uktgh54WOLbg/iriGc1jqb5yl4vHidgti",
  render_errors: [view: GenSchemasWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GenSchemas.PubSub,
  live_view: [signing_salt: "krRZ0hVj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
