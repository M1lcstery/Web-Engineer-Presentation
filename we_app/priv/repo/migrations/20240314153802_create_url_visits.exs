defmodule WeApp.Repo.Migrations.CreateUrlVisits do
  use Ecto.Migration

  def change do
    create table(:url_visits) do
      add :full_url, :string
      add :utm_source, :string
      add :utm_campaign, :string

      timestamps()
    end
  end
end
