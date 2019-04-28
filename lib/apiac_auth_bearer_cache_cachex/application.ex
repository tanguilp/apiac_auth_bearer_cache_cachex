defmodule APIacAuthBearerCacheCachex.Application do
  @moduledoc false

  use Application

  import Supervisor.Spec

  def start(_type, _args) do
    cachex_opts = Application.get_env(:apiac_auth_bearer_cache_cachex, :cachex_opts, [])

    children = [
      worker(Cachex, [:apiac_auth_bearer_cache_cachex, cachex_opts])
    ]

    opts = [strategy: :one_for_one, name: APIacAuthBearerCacheCachex.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
