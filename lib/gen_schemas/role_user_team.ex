defmodule GenSchemas.RoleUserTeam do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "role_userteams" do
    field :role_id, :binary_id
    field :user_team_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(role_user_team, attrs) do
    role_user_team
    |> cast(attrs, [])
    |> validate_required([])
  end
end
