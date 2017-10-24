defmodule TechAnnouncementsWeb.PageController do
  use TechAnnouncementsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
