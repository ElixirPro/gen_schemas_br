defmodule GenSchemas.Repo.Migrations.CreateRoleUserteams do
  use Ecto.Migration

  def change do
    create table(:role_userteams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :role_id, references(:roles, on_delete: :nothing, type: :binary_id)
      add :user_team_id, references(:userteams, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:role_userteams, [:role_id])
    create index(:role_userteams, [:user_team_id])
  end
end
