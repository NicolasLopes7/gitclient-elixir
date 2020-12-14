defmodule GitClient.Client do
    use Tesla

    plug(Tesla.Middleware.BaseUrl, "https://api.github.com")
    plug(Tesla.Middleware.Headers, [{"User-Agent", "gitclient"}])
    plug(Tesla.Middleware.JSON)

    def getReposByUsername(user) do
      "/users/#{user}/repos"
      |> get()
      |> handleGet()
    end

    defp handleGet({:ok, %Tesla.Env{status: 200, body: body}}) do
      {:ok, body}
    end

    defp handleGet({:ok, %Tesla.Env{status: 404}}) do
      {:error, "User not found!"}
    end

    defp handleGet({:error, _reason}) do
      {:error, "Some error"}
    end
end
