# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :pretty_installer, PrettyInstallerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GS2uIkGnqO0K2+J6q4O2nkgwnE6eh/3KMAc+h23ELQtdkHaxaYKWd2mSuNAPMY1p",
  render_errors: [view: PrettyInstallerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PrettyInstaller.PubSub,
  live_view: [signing_salt: "dR3ODzjD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
