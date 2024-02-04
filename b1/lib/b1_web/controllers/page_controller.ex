defmodule B1Web.PageController do
  use B1Web, :controller

  def hangman(conn, _params) do
    render(conn, :hangman)
  end

  def new(conn, _params) do
  end
end
