defmodule APISexAuthBearerCacheCachex.MixProject do
  use Mix.Project

  def project do
    [
      app: :apisex_auth_bearer_cache_cachex,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {APISexAuthBearerCacheCachex.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:apisex_auth_bearer, github: "tanguilp/apisex_auth_bearer", tag: "master"},
      {:cachex, "~> 3.1"}
    ]
  end
end
