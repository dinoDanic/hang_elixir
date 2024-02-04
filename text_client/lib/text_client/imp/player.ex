defmodule TextClient.Imp.Player do
  alias Hangman

  @typep game :: Hangman.game()
  @typep tally :: Hangman.tally()

  @typep state :: {game, tally}

  @spec start() :: :ok
  def start() do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interact({game, tally})
  end

  @spec interact(state) :: :ok

  def interact({_game, _tally = %{game_state: :won}}) do
    IO.puts("congrats, you won!")
  end

  def interact({_game, tally = %{game_state: :lost}}) do
    IO.puts("congrats, you lost. the word was #{tally.letters |> Enum.join()}")
  end

  def interact({game, tally}) do
    IO.puts(feedback_for(tally))
    IO.puts(current_word(tally))

    tally =
      Hangman.make_move(game, get_guess())

    interact({game, tally})
  end

  def feedback_for(tally = %{game_state: :initializing}) do
    "Welcome! im thinking of a #{tally.letters |> length} letter word"
  end

  def feedback_for(_tally = %{game_state: :good_guess}), do: "Good guess"
  def feedback_for(_tally = %{game_state: :bad_guess}), do: "Sorry, wrong letter"
  def feedback_for(_tally = %{game_state: :already_used}), do: "you used that letter"

  def current_word(tally) do
    [
      "words so far: ",
      tally.letters |> Enum.join(" "),
      "      turn left: ",
      tally.turns_left |> to_string,
      "      used so far: ",
      tally.used |> Enum.join(",")
    ]
  end

  def get_guess() do
    IO.gets("Next letter: ")
    |> String.trim()
    |> String.downcase()
  end

  # @type state :: :initializing :good_guess | :bad_guess | :already_used
end
