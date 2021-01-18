defmodule GenSchemas.Repo.Migrations.CreatePermissionRole do
  use Ecto.Migration

  def change do
    create table(:permission_role, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :permission_id, references(:permissions, on_delete: :nothing, type: :binary_id)
      add :role_id, references(:roles, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:permission_role, [:permission_id])
    create index(:permission_role, [:role_id])
  end
end
