import Config

# Logger with correlation_id support
config :logger,
  level: :info,
  backends: [:console]

config :logger, :console,
  format: "[$time] [$level] $message\n",
  metadata: [:correlation_id]


config :bot_army_library_runtime, :pack_mode, true

config :bot_army_youtube_manager, :start_repo, true
config :bot_army_media_ingestion, :start_repo, true

import_config "#{config_env()}.exs"
