# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :web,
  namespace: SegmentChallenge.Web

# Configures the endpoint
config :web, SegmentChallenge.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IH9pbxBqCWacEFPR3jW4jSVcJj4P4lWxBBY4mNcQcafRH465dwxJcN9ruVz81s2u",
  render_errors: [view: SegmentChallenge.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SegmentChallenge.Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
