defmodule ReadhoardWeb.ErrorJSONTest do
  use ReadhoardWeb.ConnCase, async: true

  test "renders 404" do
    assert ReadhoardWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert ReadhoardWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
