defmodule PrometheusEx.Mixfile do
  use Mix.Project

  @version "1.1.0"

  def project do
    [app: :prometheus_ex,
     version: @version,
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     name: "Prometheus.ex",
     deps: deps(),
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.html": :test],
     docs: [main: Prometheus,
            source_ref: "v#{@version}",
            source_url: "https://github.com/deadtrickster/prometheus.ex",
            extras: ["pages/Mnesia Collector.md",
                     "pages/VM Memory Collector.md",
                     "pages/VM Statistics Collector.md",
                     "pages/VM System Info Collector.md",
                     "pages/Time.md"]]]
  end

  def application do
    [applications: [:logger,
                    :prometheus]]
  end

  defp description do
    """
    Elixir-friendly Prometheus monitoring system client.
    """
  end

  defp package do
    [maintainers: ["Ilya Khaprov"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/deadtrickster/prometheus.ex",
              "Prometheus.erl" => "https://hex.pm/packages/prometheus",
              "Ecto Instrumenter" => "https://hex.pm/packages/prometheus_ecto",
              "Phoenix Instrumenter" => "https://hex.pm/packages/prometheus_phoenix",
              "Plugs Instrumenter/Exporter" => "https://hex.pm/packages/prometheus_plugs",
              "Process info Collector" => "https://hex.pm/packages/prometheus_process_collector"}]
  end

  defp deps do
    [{:prometheus, "~> 3.1"},
     {:credo, git: "https://github.com/rrrene/credo", only: [:dev, :test]},
     {:excoveralls, "~> 0.5.6", only: :test},
     {:ex_doc, "~> 0.11", only: :dev},
     {:earmark, ">= 0.0.0", only: :dev}]
  end
end
