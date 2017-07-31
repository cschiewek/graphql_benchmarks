defmodule TestData do
  @moduledoc """
  Based on https://gist.github.com/lovitt/effa205b876d9a9b86ee58399cceaf31#file-ruby_graphql_large_response_benchmark-rb-L23-L66
  """
  defstruct id: nil, int1: nil, int2: nil, string1: nil, string2: nil, boolean1: nil, boolean2: nil,
            int_array: nil, string_array: nil, boolean_array: nil

  def new do
    %TestData{
      id: random_id(),
      int1: random_int(),
      int2: random_int(),
      string1: random_string(),
      string2: random_string(),
      boolean1: random_boolean(),
      boolean2: random_boolean(),
      int_array: random_array("int"),
      string_array: random_array("string"),
      boolean_array: random_array("boolean")
    }
  end

  def random_id, do: UUID.uuid1()
  def random_int, do: :rand.uniform(100000)
  # SecureRandom.base64 default size is 16
  def random_string, do: :crypto.strong_rand_bytes(16) |> Base.url_encode64
  def random_boolean, do: Enum.random([true, false])
  def random_array(type) do
    Enum.map(1..10, fn(_) ->
      function = String.to_atom("random_#{type}")
      apply(__MODULE__, function, [])
    end)
  end
end
