defmodule TextClient do
  @spec start() :: :ok
  defdelegate start(), to: TextClient.Imp.Player
end
