defmodule GenSchemas.Permission do
  use Ecto.Schema
  import Ecto.Changeset
  alias GenSchemas.{Role, PermissionRole}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "permissions" do
    field :description, :string
    field :name, :string

    many_to_many :roles, Role, join_through: PermissionRole, on_replace: :delete
    timestamps()
  end

  @doc false
  def changeset(permission, attrs) do
    permission
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end
end
