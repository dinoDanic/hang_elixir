defmodule TextClient do
  @spec start() :: :ok

  def start do
    TextClient.Runtime.RemoteHangman.connect()
    |> TextClient.Imp.Player.start()
  end
end
