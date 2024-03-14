defmodule UrlTracker do
  def capture_url(conn, full_url) do  # Accept both conn and full_url

    utm_source = get_param(conn, "utm_source")
    utm_campaign = get_param(conn, "utm_campaign")

    %{
      full_url: full_url,
      utm_source: get_param(conn, "utm_source"),
      utm_campaign: get_param(conn, "utm_campaign")
    }
  end

  defp get_param(conn, name) do
    conn.params[name]
  end
end
