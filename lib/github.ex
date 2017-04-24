defmodule Github do
  def org_url(org_name) when is_bitstring(org_name), do: "https://api.github.com/orgs/#{org_name}?access_token=7a37b2d71b38500dc3c540d354db13e5f1e42c33"
  def repo_url(owner_name, repo_name) when is_bitstring(owner_name) and is_bitstring(repo_name), do: "https://api.github.com/repos/#{owner_name}/#{repo_name}?access_token=7a37b2d71b38500dc3c540d354db13e5f1e42c33"
  def org(org_name) do
    %{body: response_body, status_code: status} = HTTPoison.get!("#{org_url(org_name)}")
    json_obj = Poison.decode!("#{response_body}")
    handle_response(status, json_obj)
  end

  def repo(owner_name, repo_name) do
    %{body: response_body, status_code: status} = HTTPoison.get!("#{repo_url(owner_name,repo_name)}")
    json_obj = Poison.decode!("#{response_body}")
    IO.puts status
    handle_response(status, json_obj)
  end

  defp handle_response(200, obj) do
        {:ok, obj }
  end
  defp handle_response(_, obj) do
    {:error, obj }    
  end
end
