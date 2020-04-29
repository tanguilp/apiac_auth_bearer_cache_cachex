# APIacAuthBearerCacheCachex

An application implementing the `APIacAuthBearer.Cache` behaviour with Cachex

## Installation

To use it in your application as your cache for the `APIacAuthBearer` plug, add this to your
dependencies:

```elixir
def deps do
  [
    {:apiac_auth_bearer_cache_cachex, "~> 1.0"}
  ]
end
```

and then reference this cache implementation in your plug options:
```elixir
Plug APIacAuthBearer, bearer_validator: {APIacAuthBearer,[...]},
		       cache: {APIacAuthBearerCacheCachex, [ttl: 60*10]}

```

On startup, this application will automatically start the cache.

It is possible to add Cachex-specific configuration in the config files:

```elixir
config :apiac_auth_bearer_cache_cachex,
	cachex_opts: ..., # Cachex cache options
```

for example

```elixir
config :apiac_auth_bearer_cache_cachex,
	cachex_opts: [
		nodes: [
			:node1@server1,
			:node2@server1,
			:node1@server2,
			:node1@server3
		],
		limit: 200_000
	]
```
