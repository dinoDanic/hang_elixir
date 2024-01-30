defmodule TextClient.Imp.Player do
  @typep game :: Hangman.game()
  @typep tally :: Hangman.tally()

  @typep state :: {
           game,
           tally
         }

  @spec start() :: :ok
  def start() do
    game = Hangman.new_game()
  end

  @spec interact(state) :: :ok
  def interact(_state) do
    # feedback  
    # display current word
    # get next guess
    # make move
    # interact()
    :ok
  end
end
