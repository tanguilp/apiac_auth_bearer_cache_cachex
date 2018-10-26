defmodule APISexAuthBearerCacheCachex.Application do
  @moduledoc false

  use Application

  import Supervisor.Spec

  def start(_type, _args) do
    cache_opts = Application.get_env(:apisex_auth_bearer_cache_cachex, :cache_opts, [])
    server_opts = Application.get_env(:apisex_auth_bearer_cache_cachex, :server_opts, [])

    children = [
      worker(Cachex, [:apisex_auth_bearer_cache_cachex, [cache_opts, server_opts]])
    ]

    opts = [strategy: :one_for_one, name: APISexAuthBearerCacheCachex.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
