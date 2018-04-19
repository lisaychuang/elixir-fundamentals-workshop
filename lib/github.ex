require IEx

defmodule Github do
  # rem to add access_token
  def org_url(org_name) when is_bitstring(org_name), do: "https://api.github.com/orgs/#{org_name}"
  def org(org_name) do
    http_result = HTTPoison.get(org_url(org_name))
    processResponse(http_result)
  end

  # rem to add access_token
  def repo_url(owner_name, repo_name) when is_bitstring(owner_name) and is_bitstring(repo_name), do: "https://api.github.com/repos/#{owner_name}/#{repo_name}"
  
  def repo(owner_name, repo_name) do
    http_result = HTTPoison.get(repo_url(owner_name, repo_name))
    processResponse(http_result)
  end

  # successful http response (ONLY 200)
  defp processResponse({:ok, %{status_code: 200, body: response_body} }) do
    {:ok, Poison.decode!(response_body)}
  end

  # successful http response (non-200)
  defp processResponse({:ok, %{body: response_body} }) do
    {:error, Poison.decode!(response_body)}
  end

  # Unsuccessful http response 
  defp processResponse(_) do
    {:error, "WTF"}
  end
end