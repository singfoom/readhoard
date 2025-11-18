defmodule Readhoard.UserTest do
  use Readhoard.DataCase

  alias Readhoard.Accounts.User

  describe "changeset/2" do
    test "valid changeset with all fields" do
      attrs = %{
        email: "user@example.com",
        password: "password123",
        first_name: "John",
        last_name: "Doe"
      }

      changeset = User.changeset(%User{}, attrs)

      assert changeset.valid?
      assert get_change(changeset, :email) == "user@example.com"
      assert get_change(changeset, :first_name) == "John"
      assert get_change(changeset, :last_name) == "Doe"
      assert get_change(changeset, :hashed_password) != nil
    end

    test "valid changeset with required fields only" do
      attrs = %{
        email: "user@example.com",
        password: "password123"
      }

      changeset = User.changeset(%User{}, attrs)

      assert changeset.valid?
      assert get_change(changeset, :email) == "user@example.com"
      assert get_change(changeset, :hashed_password) != nil
    end

    test "invalid changeset without email" do
      attrs = %{password: "password123"}
      changeset = User.changeset(%User{}, attrs)

      refute changeset.valid?
      assert "can't be blank" in errors_on(changeset).email
    end

    test "invalid changeset without password" do
      attrs = %{email: "user@example.com"}
      changeset = User.changeset(%User{}, attrs)

      refute changeset.valid?
      assert "can't be blank" in errors_on(changeset).password
    end

    test "invalid changeset with invalid email format" do
      attrs = %{
        email: "invalid-email",
        password: "password123"
      }

      changeset = User.changeset(%User{}, attrs)

      refute changeset.valid?
      assert "must be a valid email" in errors_on(changeset).email
    end

    test "invalid changeset with short password" do
      attrs = %{
        email: "user@example.com",
        password: "12345"
      }

      changeset = User.changeset(%User{}, attrs)

      refute changeset.valid?
      assert "must be at least 6 characters" in errors_on(changeset).password
    end

    test "invalid changeset with mismatched password confirmation" do
      attrs = %{
        email: "user@example.com",
        password: "password123",
        password_confirmation: "different"
      }

      changeset = User.changeset(%User{}, attrs)

      refute changeset.valid?
      assert "does not match password" in errors_on(changeset).password_confirmation
    end
  end

  describe "email_changeset/3" do
    test "valid email changeset" do
      attrs = %{
        email: "user@example.com"
      }

      changeset = User.email_changeset(%User{}, attrs)

      assert changeset.valid?
    end

    test "invalid registration changeset with invalid email" do
      attrs = %{
        email: "userexample"
      }

      changeset = User.email_changeset(%User{}, attrs)

      refute changeset.valid?
      assert "must have the @ sign and no spaces" in errors_on(changeset).email
    end
  end
end
