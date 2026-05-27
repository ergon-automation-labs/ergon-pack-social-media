import Config

config :bot_army_library_runtime, :pack_mode, true

config :bot_army_youtube_manager, :start_repo, true
config :bot_army_media_ingestion, :start_repo, true

import_config "#{config_env()}.exs"