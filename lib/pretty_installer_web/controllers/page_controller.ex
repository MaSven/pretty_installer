defmodule PrettyInstallerWeb.PageController do
  use PrettyInstallerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
