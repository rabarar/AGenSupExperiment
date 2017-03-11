defmodule SupExp.Worker do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def stop(pid) do
    GenServer.call(pid, :stop)
  end

  def handle_call(:stop, _fromn, state) do
    {:stop, :normal, :ok, state}
  end

end
