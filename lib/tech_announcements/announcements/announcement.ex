defmodule TechAnnouncements.Announcements.Announcement do
  use Ecto.Schema
  import Ecto.Changeset
  alias TechAnnouncements.Announcements.Announcement


  schema "announcements" do
    field :content, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Announcement{} = announcement, attrs) do
    announcement
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end
