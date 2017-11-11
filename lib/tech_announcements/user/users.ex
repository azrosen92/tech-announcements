defmodule TechAnnouncements.Users do
  import Ecto.Query, warn: false
  alias TechAnnouncements.Repo

  alias TechAnnouncements.User.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end