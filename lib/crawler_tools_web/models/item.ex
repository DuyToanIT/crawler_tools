defmodule Item do
  @derive {Jason.Encoder, only: [:item_basic]}
  defstruct item_basic: %Item.Basic{}
end

