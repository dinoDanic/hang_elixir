defmodule Runtime.Application do
  use Application

  def start(_start_type, _start_args) do
    Runtime.Server.start_link()
  end
end
