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

## To start the meta-agent
```elixir-lang
iex -S mix
SupExp.Agent.init

SupExp.Agent.start(:rob)
SupExp.Agent.list ## to see all agents in the meta-agent state
SupExp.Agent.stop(:rob)
```

## To start a worker supervisor and subsequent children:
```elixir-lang
iex -S mix

## App will automaticall start -> {:ok, worker_sup} = SupExp.WorkerSupervisor.start_link({SupExp.Worker, :start_link, []})

## start them manually through Supervisor
Supervisor.start_child(SupExp.WorkerSupervisor,[[]]) ## optionally name the children,  [[name: :rob]]

## Or start them through the SupExp Mod naming with an atom or a string
SupExp.create_child(:rb)

## stop the child (and have the supervisor restart it)
SupExp.Worker.stop(:rb)

## check out what children are what...
Supervisor.which_children(SupExp.WorkerSupervisor)

Supervisor.count_children(SupExp.WorkerSupervisor)

## and watch the whole thing with
:observer.start

```

# AGenSupExperiment
