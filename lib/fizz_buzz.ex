defmodule FizzBuzz do
  def play_game(number) when number >= 1 do
    1..number
    |> Enum.map(&player_turn/1)
    |> Enum.join(", ")
  end

  defp player_turn(number) do
    case number do 
      x when rem(number,3)==0 and rem(number,5) ==0 -> "FizzBuzz"
      x when rem(number,3) == 0 -> "Fizz"
      x when rem(number,5) == 0 -> "Buzz"
      _ -> number
    end
  end
end