defmodule Deck do
  @deck for suit <- ~w(H C S D),  #this shorthand converts into [H,C,S,D]
          card <- ~w(A 2 3 4 5 6 7 8 9 10 J Q K),
          do: "#{card}#{suit}"

  def get_cards(num) when num > 0 do
    @deck
    |> Enum.shuffle #shuffles the list order
    |> Enum.take(num) #take specific number of cards
end