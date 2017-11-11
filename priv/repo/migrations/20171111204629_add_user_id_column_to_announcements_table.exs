defmodule TechAnnouncements.Repo.Migrations.AddUserIdColumnToAnnouncementsTable do
  use Ecto.Migration

  def change do
    alter table(:announcements) do
      add :user_id, references(:users), null: false
    end
  end
end
