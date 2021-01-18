defmodule GenSchemas.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias GenSchemas.Team

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "projects" do
    field :title, :string
    belongs_to :team, Team, foreign_key: :team_id, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> unique_constraint(:title)
  end
end
