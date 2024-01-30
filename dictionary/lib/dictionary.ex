defmodule Dictionary do
  @word_list "assets/words.txt"
             |> File.read!()
             |> String.split(~r/\n/, trim: true)

  def random_word do
    @word_list
    |> Enum.random()
  end

  def swapped_values({a, b}) do
    if a == b do
      true
    else
      false
    end
  end

  def eq(a, a), do: true
  def eq(_, _), do: false

  def len([]), do: 0
  def len([_h | t]), do: 1 + len(t)

  def sum([]), do: 0
  def sum([h | t]), do: h + sum(t)
end
