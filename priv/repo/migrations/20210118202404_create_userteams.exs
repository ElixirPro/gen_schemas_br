defmodule GenSchemas.Repo.Migrations.CreateUserteams do
  use Ecto.Migration

  def change do
    create table(:userteams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :team_id, references(:teams, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:userteams, [:user_id])
    create index(:userteams, [:team_id])
  end
end
