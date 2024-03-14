defmodule WeAppWeb.PageController do
  use WeAppWeb, :controller

  alias UrlTracker
  alias WeApp.UrlVisit

  def home(conn, _params) do
    full_url = get_full_url(conn) # Reconstruct the full URL
    url_data = UrlTracker.capture_url(conn, full_url) # Add the full URL
    changeset = UrlVisit.changeset(%UrlVisit{}, url_data)

    case WeApp.Repo.insert(changeset) do
      {:ok, _visit} ->
        render(conn, :home, layout: false)
      {:error, changeset} ->
        IO.inspect(changeset.errors)
        render(conn, :home, layout: false)
    end
  end

  # Helper function to reconstruct the URL
  defp get_full_url(conn) do
    scheme = if conn.scheme == :https do "https" else "http" end
    host = conn.host
    port = conn.port
    request_path = conn.request_path
    query_string = if conn.query_string == "", do: "", else: "?" <> conn.query_string

    scheme <> "://" <> host <> ":" <> Integer.to_string(port) <> request_path <> query_string
  end
end
