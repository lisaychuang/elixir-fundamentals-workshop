defmodule FizzBuzz do
  def play_game(number) when number >= 1 do
    1..number
    |> Enum.map(&player_turn/1)
    |> Enum.join(", ")
  end

  defp player_turn(number) do
    case number do 
      number when rem(number, 15) === 0 -> "FizzBuzz" 
      number when rem(number, 5) === 0 -> "Buzz" 
      number when rem(number, 3) === 0 -> "Fizz" 
      number -> "#{number}"
    end
  end
end