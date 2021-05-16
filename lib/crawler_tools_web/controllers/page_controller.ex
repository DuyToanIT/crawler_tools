defmodule CrawlerToolsWeb.PageController do
  use CrawlerToolsWeb, :controller
  import Shopee.Service

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def get_items(conn, %{"shopId" => shop_id} = params) do
    sort_by = Map.get(params, "sortBy", "pop")
    limit = Map.get(params, "limit", 30)
    offset = Map.get(params, "offset", 0)
    items = Shopee.Service.get_items(shop_id, sort_by,limit,offset).items
    render(conn, "shopee.html", item_store: items)
  end

end
