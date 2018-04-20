defmodule ListUtils do
  # Exercise 7
  def reduce([h|t], reducer, accumulator) do
    newAcc = reducer.(h, accumulator)
    reduce(t, reducer, newAcc)
  end
  def reduce([], _reducer, accumulator), do: accumulator


  def map(original, transform_fn, transformed \\ []) do
    original
    |> reduce(fn(item, transformed_list)->
      transformed_list ++ [transform_fn.(item)]
    end, [])
  end

  # Exercise 8
  def bounds(list), do: {nil, nil}

  # Exercise 13
  def pmap(list, func) do
    # Add your exercise 13 solution here
  end
end