defmodule Readhoard.Repo do
  use Ecto.Repo,
    otp_app: :readhoard,
    adapter: Ecto.Adapters.Postgres
end
