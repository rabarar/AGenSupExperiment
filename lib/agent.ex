defmodule SupExp.Agent do

  @agents :__agents
  def init() do
    IO.puts "starting module agent."
    Agent.start_link(fn->[] end, name: @agents)
  end

  def start(agent) when is_atom(agent) do
    case Agent.start_link(fn -> nil end, name: agent) do
      {:ok, pid} ->
        agents = get(@agents)
        set(@agents, agents ++ [agent] )
      _ ->
          {:error, :no_agent_started}
    end
  end

  def get(agent) when is_atom(agent) do
    Agent.get(agent, fn state -> state end)
  end

  def set(agent, val)  when is_atom(agent) do
    Agent.update(agent, fn state -> val end)
  end

  def stop(agent) when is_atom(agent) do
    case Agent.stop(agent) do
      :ok ->
        agents = get(@agents)
        set(@agents, agents -- [agent])
      _ ->
        {:error, :no_agent_to_stop}
    end
  end

  def list() do
    get(@agents)
  end
end
