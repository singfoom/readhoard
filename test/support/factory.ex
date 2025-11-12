defmodule Readhoard.Factory do
  @moduledoc """
  An ex machina based factory for data in tests
  """
  use ExMachina.Ecto, repo: Readhoard.Repo
  alias Readhoard.Book

  def book_factory do
    %Book{
      title:
        Enum.random([
          "On Basilisk Station",
          "The Wheel of Time",
          "Perdido Street Station",
          "SevenEves",
          "Anathema",
          "Authority"
        ]),
      word_count: Enum.random(0..20_000)
    }
  end
end
