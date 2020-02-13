defmodule AuthApiWeb.GithubAuthController do
  use AuthApiWeb, :controller

  @doc """
  `index/2` handles the callback from GitHub Auth API redirect.
  """
  def index(conn, %{"code" => code, "state" => client} = params) do
    {:ok, profile} = ElixirAuthGithub.github_auth(code)
    redirect(conn, external: "#{client}?jwt=test.jwt.example")
  end
end
