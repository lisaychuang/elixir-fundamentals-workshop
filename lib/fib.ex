
defmodule Fib do
    def reverse(0), do: []
    def reverse(1), do: [1]
    def reverse(2), do: [1,1]
    def reverse(x) when x>2 do
        prev = reverse(x - 1) # [3,2,1,1]
        [one_ago | [two_ago | _ ]] = prev 
        [(one_ago + two_ago) | prev]
    end
    
    def reverse(x), do: nil

    def normal(x) when x >= 0 do
        reverse(x)
        |> Enum.reverse
    end

    def normal(x), do: nil
end 
   