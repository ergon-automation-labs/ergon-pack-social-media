defmodule ErgonPackSocialMedia.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :ergon_pack_social_media,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        social_media_pack: [
          applications: [
            bot_army_library_runtime: :permanent,
            bot_army_library_core: :permanent,
            bot_army_library_learning: :permanent,
            bot_army_youtube_manager: :permanent,
            bot_army_media_ingestion: :permanent,
            ergon_pack_social_media: :permanent
          ]
        ]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ErgonPackSocialMedia.Application, []}
    ]
  end

  defp deps do
    [
      {:bot_army_library_core, path: "../bot_army_library_core"},
      {:bot_army_library_runtime, path: "../bot_army_library_runtime"},
      {:bot_army_library_learning, path: "../bot_army_library_learning"},
      {:bot_army_youtube_manager, path: "../bot_army_youtube_manager"},
      {:bot_army_media_ingestion, path: "../bot_army_media_ingestion"}
    ]
  end
end
