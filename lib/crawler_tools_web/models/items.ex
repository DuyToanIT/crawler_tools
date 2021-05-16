defmodule Items do
  @derive {Jason.Encoder, only: [:items]}
  defstruct items: [%Item{}]
end

