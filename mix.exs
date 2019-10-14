defmodule Sqns.MixProject do
  use Mix.Project

  def project do
    [
      app: :sqns,
      version: "0.1.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: coverage_options(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.circle": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:ex_aws, :logger]
    ]
  end

  defp coverage_options do
    case System.get_env("CI") do
      "true" -> [tool: ExCoveralls]
      _ -> []
    end
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:atomic_map, "~> 0.8"},
      {:broadway_sqs, "~> 0.4.0"},
      {:configparser_ex, "~> 4.0.0"},
      {:credo, "~> 1.1.1", only: [:dev, :test], runtime: false},
      {:ex_aws, "~> 2.1"},
      {:ex_aws_s3, "~> 2.0"},
      {:ex_aws_sns,
       git: "https://github.com/mbklein/ex_aws_sns.git", branch: "add-filter-policy"},
      {:ex_aws_sqs, "~> 3.0"},
      {:excoveralls, "~> 0.10", only: :test},
      {:hackney, "~> 1.15"},
      {:inflex, "~> 2.0.0"},
      {:jason, "~> 1.0"},
      {:mox, "~> 0.5", only: :test},
      {:poison, ">= 3.0.0"},
      {:sweet_xml, "~> 0.6"}
    ]
  end
end
