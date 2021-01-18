defmodule GenSchemas.Repo do
  use Ecto.Repo,
    otp_app: :gen_schemas,
    adapter: Ecto.Adapters.Postgres
end
