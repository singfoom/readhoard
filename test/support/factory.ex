defmodule Readhoard.Factory do
  @moduledoc """
  An ex machina based factory for data in tests
  """
  use ExMachina.Ecto, repo: Readhoard.Repo
  alias Readhoard.{Author, Book}

  alias Readhoard.Accounts.User

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
      word_count: Enum.random(0..20_000),
      author: build(:author)
    }
  end

  def author_factory do
    %Author{
      first_name:
        Enum.random([
          "Isaac",
          "Ursula",
          "China",
          "Neal",
          "Kim",
          "Jeff"
        ]),
      last_name:
        Enum.random([
          "Asimov",
          "Le Guin",
          "Miéville",
          "Stephenson",
          "Robinson",
          "VanderMeer"
        ])
    }
  end

  def user_factory do
    %User{
      email: sequence(:email, &"user#{&1}@example.com"),
      hashed_password: Bcrypt.hash_pwd_salt("password123"),
      first_name: Enum.random(["Alice", "Bob", "Carol", "David", "Eve", "Frank"]),
      last_name: Enum.random(["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia"])
    }
  end
end
