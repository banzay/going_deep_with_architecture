defmodule SegmentChallenge.Web.PageController do
  use SegmentChallenge.Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
