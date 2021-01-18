defmodule GenSchemas.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias GenSchemas.{User, Project}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams" do
    field :name, :string
    belongs_to :user, User, foreign_key: :user_id, type: :binary_id

    has_many :projects, Project

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name])
    |> cast_assoc(:projects, with: &Project.changeset/2)
    |> validate_required([:name])
  end
end
