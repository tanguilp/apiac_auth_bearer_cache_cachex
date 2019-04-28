defmodule APIacAuthBearerCacheCachex do
  @behaviour APIacAuthBearer.Cache

  @cache :apiac_auth_bearer_cache_cachex

  @moduledoc """
  Cachex implementation of the `APIacAuthBearer.Cache` behaviour
  """

  @doc """
  `APIacAuthBearer.Cache` callback implementation
  """
  @impl true
  def init_opts(opts) do
    # cachex ttl is in ms
    Keyword.put(opts, :ttl, opts[:ttl] * 1000)
  end

  @doc """
  `APIacAuthBearer.Cache` callback implementation
  """
  @impl true
  def put(bearer, attributes, opts) do
    Cachex.put(@cache, bearer, attributes, opts)
  end

  @doc """
  `APIacAuthBearer.Cache` callback implementation
  """
  @impl true
  def get(bearer, _opts) do
    case Cachex.get(@cache, bearer) do
      {:ok, attrs} when not is_nil(attrs) ->
        attrs

      {:ok, nil} ->
        nil

      _ ->
        nil
    end
  end
end
