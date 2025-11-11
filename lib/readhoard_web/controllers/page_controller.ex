defmodule ReadhoardWeb.PageController do
  use ReadhoardWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
