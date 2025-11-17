defmodule Readhoard.Repo.Migrations.CreateAuthors do
  use Ecto.Migration
  # excellent_migrations:safety-assured-for-this-file table_dropped

  def up do
    create_if_not_exists table(:authors, primary_key: false) do
      add :id, :string, primary_key: true
      add :first_name, :string
      add :last_name, :string

      timestamps(type: :utc_datetime)
    end
  end

  def down do
    drop_if_exists table(:authors)
  end
end
