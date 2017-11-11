defmodule TechAnnouncementsWeb.AnnouncementController do
  use TechAnnouncementsWeb, :controller

  alias TechAnnouncements.Announcements
  alias TechAnnouncements.Announcements.Announcement

  def index(conn, _params) do
    announcements = Announcements.list_announcements_desc()
    changeset = Announcement.changeset(%Announcement{}, %{})
    render(conn, "index.html", announcements: announcements, changeset: changeset)
  end

  def create(conn, %{"announcement" => announcement_params}) do
    case Announcements.create_announcement(announcement_params) do
      {:ok, announcement} ->
        conn
        |> put_flash(:info, "Announcement created successfully.")
        |> redirect(to: announcement_path(conn, :show, announcement))
      {:error, %Ecto.Changeset{} = changeset} ->
        announcements = Announcements.list_announcements_desc()
        render(conn, "index.html", announcements: announcements, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    announcement = Announcements.get_announcement!(id)
    render(conn, "show.html", announcement: announcement)
  end

  def edit(conn, %{"id" => id}) do
    announcement = Announcements.get_announcement!(id)
    changeset = Announcements.change_announcement(announcement)
    render(conn, "edit.html", announcement: announcement, changeset: changeset)
  end

  def update(conn, %{"id" => id, "announcement" => announcement_params}) do
    announcement = Announcements.get_announcement!(id)

    case Announcements.update_announcement(announcement, announcement_params) do
      {:ok, announcement} ->
        conn
        |> put_flash(:info, "Announcement updated successfully.")
        |> redirect(to: announcement_path(conn, :show, announcement))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", announcement: announcement, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    announcement = Announcements.get_announcement!(id)
    {:ok, _announcement} = Announcements.delete_announcement(announcement)

    conn
    |> put_flash(:info, "Announcement deleted successfully.")
    |> redirect(to: announcement_path(conn, :index))
  end
end
