defmodule Item.Basic do
  @derive {Jason.Encoder, only: [:name, :price]}
  defstruct [:name, :price]
end
