defmodule TechAnnouncements.AnnouncementsTest do
  use TechAnnouncements.DataCase

  alias TechAnnouncements.Announcements
  alias TechAnnouncements.Users

  describe "announcements" do
    alias TechAnnouncements.Announcements.Announcement

    @user_attrs %{email: "test@email.com", encrypted_password: "password"}
    @valid_attrs %{content: "some content", title: "some title", user_id: 1}
    @update_attrs %{content: "some updated content", title: "some updated title"}
    @invalid_attrs %{content: nil, title: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} = attrs
      |> Enum.into(@user_attrs)
      |> Users.create_user
      user
    end

    def announcement_fixture(attrs \\ %{}) do
      {:ok, user} = Users.create_user(@user_attrs)
      {:ok, announcement} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Map.put(:user_id, user.id)
        |> Announcements.create_announcement()

      announcement
    end

    test "list_announcements/0 returns all announcements" do
      announcement = announcement_fixture()
      assert Announcements.list_announcements() == [announcement]
    end

    test "list_announcements_desc/0 returns all announcements, most recent first" do
      second_announcement_data = %{content: "some more content", title: "second announcment"}
      announcement = announcement_fixture()
      second_announcement = announcement_fixture(second_announcement_data)

      assert Announcements.list_announcements_desc() == [second_announcement, announcement]
    end

    test "get_announcement!/1 returns the announcement with given id" do
      announcement = announcement_fixture()
      assert Announcements.get_announcement!(announcement.id) == announcement
    end

    test "create_announcement/1 with valid data creates a announcement" do
      user = user_fixture

      assert {:ok, %Announcement{} = announcement} = Announcements.create_announcement(@valid_attrs |> Map.put(:user_id, user.id))
      assert announcement.content == "some content"
      assert announcement.title == "some title"
    end

    test "create_announcement/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Announcements.create_announcement(@invalid_attrs)
    end

    test "update_announcement/2 with valid data updates the announcement" do
      announcement = announcement_fixture()
      assert {:ok, announcement} = Announcements.update_announcement(announcement, @update_attrs)
      assert %Announcement{} = announcement
      assert announcement.content == "some updated content"
      assert announcement.title == "some updated title"
    end

    test "update_announcement/2 with invalid data returns error changeset" do
      announcement = announcement_fixture()
      assert {:error, %Ecto.Changeset{}} = Announcements.update_announcement(announcement, @invalid_attrs)
      assert announcement == Announcements.get_announcement!(announcement.id)
    end

    test "delete_announcement/1 deletes the announcement" do
      announcement = announcement_fixture()
      assert {:ok, %Announcement{}} = Announcements.delete_announcement(announcement)
      assert_raise Ecto.NoResultsError, fn -> Announcements.get_announcement!(announcement.id) end
    end

    test "change_announcement/1 returns a announcement changeset" do
      announcement = announcement_fixture()
      assert %Ecto.Changeset{} = Announcements.change_announcement(announcement)
    end
  end
end
