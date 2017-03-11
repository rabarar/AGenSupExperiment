defmodule SupExp do
  use Application

  def start(_type, _args) do
    {:ok, worker_sup} = SupExp.WorkerSupervisor.start_link({SupExp.Worker, :start_link, []})
    IO.puts "Starting SupExp application: pid = #{inspect worker_sup}"
    {:ok, worker_sup}
  end

  def pid(str) do
    str
    |> :erlang.binary_to_list
    |> :erlang.list_to_pid
  end

  def create_child(name) when is_atom(name)do
    Supervisor.start_child(SupExp.WorkerSupervisor, [[name: name]])
  end
  def create_child(name) do
    Supervisor.start_child(SupExp.WorkerSupervisor, [[name: String.to_atom(name)]])
  end
end
