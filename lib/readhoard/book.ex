defmodule Readhoard.Book do
  @moduledoc """
  The book schema represents a book.
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Readhoard.Author

  @type t :: %__MODULE__{
          title: String.t(),
          genre: String.t(),
          word_count: non_neg_integer()
        }

  @primary_key {:book_id, UXID, autogenerate: true, prefix: "bk", size: :medium}
  @derive {Phoenix.Param, key: :book_id}
  schema "books" do
    field :title, :string
    field :word_count, :integer
    field :genre, :string
    belongs_to :author, Author, type: :string
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :word_count, :genre, :author_id])
    |> cast_assoc(:author)
    |> validate_required([:title])
  end
end
