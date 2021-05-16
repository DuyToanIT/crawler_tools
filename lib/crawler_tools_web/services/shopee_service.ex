defmodule Shopee.Service do
  @url "https://shopee.vn"
  @get_shop_detail "#{@url}/api/v4/shop/get_shop_detail"
  @search_items "#{@url}/api/v4/search/search_items"

  def get_items(shop_id , sort_by, limit, offset) do
    url_get_items = @search_items <> "?by=#{sort_by}&limit=#{limit}&match_id=#{shop_id}&newest=#{offset}&order=desc&page_type=shop&scenario=PAGE_OTHERS&version=2"
    case HTTPoison.get(url_get_items, [],  hackney: [:insecure]) do
      {:ok, resp} ->
        items = Poison.decode!(resp.body, as: %Items{})
      {:error, msg} -> %{code: 400, data: [], message: msg.reason}
    end
  end

end
