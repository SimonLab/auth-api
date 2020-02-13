defmodule AuthApiWeb.AuthUrlController do
  use AuthApiWeb, :controller

  def index(conn, _params) do
    referer = case List.keyfind(conn.req_headers, "referer", 0) do
      {"referer", referer} ->
        referer
      nil ->
        IO.puts "no referer"
        nil
    end

    google_url = ElixirAuthGoogle.generate_oauth_url(conn) <> "&state=#{referer}"
    github_url = ElixirAuthGithub.login_url_with_scope(["user:email"]) <> "&state=#{referer}"

    client_id = System.get_env("GOOGLE_CLIENT_ID")
    scope = "profile email"

    urls = [%{url: google_url, type: "google"}, %{url: github_url, type: "github"}]
    render(conn, "index.json", urls: urls)
  end
end
