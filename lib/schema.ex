defmodule Schema do
  @moduledoc """
  Based on https://gist.github.com/lovitt/effa205b876d9a9b86ee58399cceaf31#file-ruby_graphql_large_response_benchmark-rb-L117-L164
  """
  use Absinthe.Schema
  import_types Types

  @size 10000
  @data Enum.map(1..@size, fn(_) -> TestData.new end)

  query do
    @desc "Get all blog posts"
    field :foos, list_of(:foo) do
      arg :count, :integer
      resolve &resolver/2
    end
  end

  defp resolver(%{count: count}, _context) when count > @size do
    {:error, "Count exceeds maximum"}
  end
  defp resolver(%{count: count}, _context), do: {:ok, Enum.take(@data, count)}
  defp resolver(_arguments, _context), do: {:ok, @data}
end
