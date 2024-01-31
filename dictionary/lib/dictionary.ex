defmodule Dictionary do
  alias Impl.WordList
  alias Runtime.Server

  @spec random_word() :: String.t()
  defdelegate random_word(), to: Server
end
