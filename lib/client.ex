defmodule GitClient.Client do
    use Tesla

    plug(Tesla.Middleware.BaseUrl, "https://api.github.com")
    plug(Tesla.Middleware.Headers, [{"User-Agent", "gitclient"}])
    plug(Tesla.Middleware.JSON)

    def getreposByUsername(user) do
      get("/users/#{user}/repos")
    end
end
