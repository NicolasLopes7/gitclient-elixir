defmodule GitClient.ClientTest do
  use ExUnit.Case

  import Tesla.Mock

  describe "getReposByUsername/1" do
    test "When user exists and return all repos" do
      username = "NicolasLopes7"

      response = [
        %{"id" => 1, "name" => "MyRepo1"},
        %{"id" => 1, "name" => "MyRepo1"},
      ]

      expectedResponse = {:ok, response}


      mock(fn %{method: :get, url: "https://api.github.com/users/NicolasLopes7/repos"} ->
        %Tesla.Env{status: 200, body: response}
      end)

      assert GitClient.Client.getReposByUsername(username) == expectedResponse
    end
  end
end
