# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tech_announcements,
  ecto_repos: [TechAnnouncements.Repo]

# Configures the endpoint
config :tech_announcements, TechAnnouncementsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vAvNVenA3EgVKK0MX1BYMTXYv8nY8AO95QdyqKMjGe0sDOK2qitfGuMyShUUmirt",
  render_errors: [view: TechAnnouncementsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TechAnnouncements.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
