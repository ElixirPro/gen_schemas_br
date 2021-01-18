defmodule GenSchemas.Repo.Migrations.CreatePermissions do
  use Ecto.Migration

  def change do
    create table(:permissions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :text

      timestamps()
    end

    create unique_index(:permissions, [:name])
  end
end
