defmodule Readhoard.Book do
  @moduledoc """
  The book schema represents a a book record.
  """

  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          title: String.t(),
          genre: String.t(),
          word_count: non_neg_integer()
        }

  @primary_key {:book_id, UXID, autogenerate: true, prefix: "bk", size: :medium}
  schema "books" do
    field :title, :string
    field :word_count, :integer
    field :genre, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :word_count, :genre])
    |> validate_required([:title])
  end
end
