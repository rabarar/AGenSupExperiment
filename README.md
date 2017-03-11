# Supexp

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `supexp` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:supexp, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/supexp](https://hexdocs.pm/supexp).

## To start a worker supervisor:
```elixir-lang
iex -S mix

{:ok, worker_sup} = SupExp.WorkerSupervisor.start_link({SupExp.Worker, :start_link, []})

Supervisor.start_child(worker_sup,[[]])

Supervisor.which_children(worker_sup)

Supervisor.count_children(worker_sup)

# AGenSupExperiment
