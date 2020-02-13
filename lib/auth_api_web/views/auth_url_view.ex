defmodule AuthApiWeb.AuthUrlView do
  use AuthApiWeb, :view

  def render("index.json", %{urls: urls}) do
    data = Enum.map(urls, fn url -> render("url.json", url) end)
    %{data: data}
  end

  def render("url.json", url) do
    url
  end
end
