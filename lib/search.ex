defmodule Search do
  def start do
    receive do 
      {sender, {:complete_me, term}} ->
        results = Autocomplete.get_completions(term)
        IO.puts "received term: #{term}, found #{length(results)} completions"
        send(sender, {self(), {:completions, results}})
        start
    end
  end

  def run(term) do
    import Logger
    # Kick off process
    Logger.info "Kicking off"
    search_pid = spawn(Search, :start, [])

    # Send it a message
    to_send = {:complete_me, term}
    Logger.info "Sending"
    send(search_pid, {self(), to_send})

    Logger.info "Listening"
    # Listen for a response
    receive do
      {search_pid, {:completions, items}} ->
        Logger.info "Received response"
        items
        |> Enum.join(", ")
        |> IO.puts
      x -> 
        Logger.error "Unknown message"
        IO.inspect x
    end
  end
end