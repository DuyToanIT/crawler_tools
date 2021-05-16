# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :crawler_tools, CrawlerToolsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UfOP6a8T8r3ZYfoGxtBiwNZFNUZ42TCaI61vci51ZD5HaaCJi6K1xm0sVXn4fFEf",
  render_errors: [view: CrawlerToolsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CrawlerTools.PubSub,
  live_view: [signing_salt: "1wWsYn1m"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
