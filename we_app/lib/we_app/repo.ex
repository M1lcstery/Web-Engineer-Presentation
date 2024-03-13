defmodule WeApp.Repo do
  use Ecto.Repo,
    otp_app: :we_app,
    adapter: Ecto.Adapters.SQLite3
end
