defmodule WeApp.UrlVisit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "url_visits" do
    field :full_url, :string
    field :utm_source, :string
    field :utm_campaign, :string

    timestamps()
  end

  # Add the changeset function
  @doc false # Optionally, mark as internal for documentation
  def changeset(url_visit, attrs \\ %{}) do
    url_visit
    |> cast(attrs, [:full_url, :utm_source, :utm_campaign])
    |> validate_required([:full_url]) # Add any validations you need
  end
end
