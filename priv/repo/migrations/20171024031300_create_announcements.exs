defmodule TechAnnouncements.Repo.Migrations.CreateAnnouncements do
  use Ecto.Migration

  def change do
    create table(:announcements) do
      add :title, :string
      add :content, :text

      timestamps()
    end

  end
end
