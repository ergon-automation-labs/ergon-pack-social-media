import Config

config :bot_army_library_runtime, :pack_mode, true

nats_servers =
  case System.get_env("NATS_SERVERS") do
    nil -> ["nats://nats:4222"]
    servers -> String.split(servers, ",")
  end

config :bot_army_library_runtime, :nats_servers, nats_servers

db_host = System.get_env("DATABASE_HOST") || "postgres"
db_port = String.to_integer(System.get_env("DATABASE_PORT") || "5432")
db_user = System.get_env("DATABASE_USER") || "postgres"
db_password = System.get_env("DATABASE_PASSWORD") || "postgres"

for {otp_app, repo, db_name} <- [
      {:bot_army_youtube_manager, BotArmyYoutubeManager.Repo, "bot_army_youtube_manager"},
      {:bot_army_media_ingestion, BotArmyMediaIngestion.Repo, "bot_army_media_ingestion"}
    ] do
  config otp_app, repo,
    database: db_name,
    hostname: db_host,
    port: db_port,
    username: db_user,
    password: db_password
end
