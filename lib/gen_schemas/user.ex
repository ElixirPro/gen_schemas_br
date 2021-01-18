defmodule GenSchemas.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias GenSchemas.{Team, UserTeam}

  @fields [:email, :first_name, :last_name]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string

    has_many :teams, Team

    many_to_many :userteams, Team, join_through: UserTeam, on_replace: :delete
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> cast_assoc(:teams, with: &Team.changeset/2)
    |> unique_constraint(:email)
  end

  def update_access_team(user, teams) do
    user
    |> cast(%{}, @fields)
    |> put_assoc(:userteams, teams)
  end
end
