defmodule Readhoard.Repo.Migrations.CreateBooks do
  use Ecto.Migration
  # excellent_migrations:safety-assured-for-this-file table_dropped

  def up do
    create_if_not_exists table(:books, primary_key: false) do
      add :book_id, :string, primary_key: true
      add :title, :string
      add :word_count, :integer
      add :genre, :string

      timestamps(type: :utc_datetime)
    end
  end

  def down do
    drop_if_exists table(:books)
  end
end
