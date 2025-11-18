defmodule Readhoard.Repo.Migrations.CreateUsersAuthTables do
  use Ecto.Migration
  # excellent_migrations:safety-assured-for-this-file raw_sql_executed
  # excellent_migrations:safety-assured-for-this-file column_reference_added
  # excellent_migrations:safety-assured-for-this-file table_dropped

  @disable_ddl_transaction true
  @disable_migration_lock true

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create_if_not_exists table(:users) do
      add :email, :citext, null: false
      add :hashed_password, :string
      add :confirmed_at, :utc_datetime
      add :first_name, :string
      add :last_name, :string

      timestamps(type: :utc_datetime)
    end

    create_if_not_exists unique_index(:users, [:email], concurrently: true)

    create_if_not_exists table(:users_tokens) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string
      add :authenticated_at, :utc_datetime

      timestamps(type: :utc_datetime, updated_at: false)
    end

    create_if_not_exists index(:users_tokens, [:user_id], concurrently: true)
    create_if_not_exists unique_index(:users_tokens, [:context, :token], concurrently: true)
  end

  def down do
    drop_if_exists index(:users_tokens, [:user_id], concurrently: true)
    drop_if_exists index(:users_tokens, [:context, :token], concurrently: true)
    drop_if_exists index(:users, [:email], concurrently: true)
    drop_if_exists table(:users_tokens)
    drop_if_exists table(:users)
  end
end
