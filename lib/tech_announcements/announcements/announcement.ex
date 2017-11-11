defmodule TechAnnouncements.Announcements.Announcement do
  use Ecto.Schema
  import Ecto.Changeset
  alias TechAnnouncements.Announcements.Announcement


  schema "announcements" do
    field :content, :string
    field :title, :string

    belongs_to :user, User.User

    timestamps()
  end

  @doc false
  def changeset(%Announcement{} = announcement, attrs) do
    announcement
    |> cast(attrs, [:title, :content, :user_id])
    |> validate_required([:title, :content, :user_id])
  end
end
