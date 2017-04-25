defmodule ListUtils do
  # Exercise 7
  def reduce(list, reducer, accumulator) do
    
    
  end

  def map(original, transform_fn, transformed \\ []) do
    
  end

  # Exercise 8
  def bounds(list), do: {nil, nil}

  # Exercise 13
  def pmap(list, func) do
    parent_pid =self()
    # 1. Enum.map to turn all of these items into PIDs for spawn_link(fn -> .... end)
    list
    |> Enum.map( fn item ->
      spawn_link(fn ->
        transformed_item = func.(item)
        send(parent_pid, transformed_item)
      end)
   end )

    # 2. Enum.map again and return "receive blocks" that each wait for a message to be sent back
    # 3. the function passed to spawn_link in step 1 should first calculate the "transformed value" (with func)
    #      and then send a message back to the parent, so it can be received in the receive blocks (step 2)


    
end
end