defmodule GenSchemas.UserTeam do
  use Ecto.Schema
  import Ecto.Changeset
  alias GenSchemas.{Role, RoleUserTeam}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "userteams" do
    field :user_id, :binary_id
    field :team_id, :binary_id

    many_to_many :roles, Role, join_through: RoleUserTeam, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(user_team, attrs) do
    user_team
    |> cast(attrs, [])
    |> validate_required([])
  end

  def update_roles(user_team, roles) do
    user_team
    |> cast(%{}, [])
    |> put_assoc(:roles, roles)
  end
end
