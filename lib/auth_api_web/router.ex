defmodule AuthApiWeb.Router do
  use AuthApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AuthApiWeb do
    pipe_through :api
    get "/auth/google/callback", GoogleAuthController, :index
    get "/auth/github/callback", GithubAuthController, :index
    get "/auth/urls", AuthUrlController, :index
  end
end
