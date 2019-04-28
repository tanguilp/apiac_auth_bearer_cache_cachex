defmodule APIacAuthBearerCacheCachex.MixProject do
  use Mix.Project

  def project do
    [
      app: :apiac_auth_bearer_cache_cachex,
      version: "0.2.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {APIacAuthBearerCacheCachex.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:apiac_auth_bearer, github: "tanguilp/apiac_auth_bearer", tag: "0.2.0"},
      {:cachex, "~> 3.1"},
      {:dialyxir, "~> 1.0.0-rc.4", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
