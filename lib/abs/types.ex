defmodule Abs.Types do
  @moduledoc """
  Based on https://gist.github.com/lovitt/effa205b876d9a9b86ee58399cceaf31#file-ruby_graphql_large_response_benchmark-rb-L71-L89
  """
  use Absinthe.Schema.Notation

  object :foo do
    field :id, :id

    field :int1, :integer
    field :int2, :integer

    field :string1, :string
    field :string2, :string

    field :boolean1, :boolean
    field :boolean2, :boolean

    field :int_array, list_of(:integer)
    field :string_array, list_of(:string)
    field :boolean_array, list_of(:boolean)
  end
end
