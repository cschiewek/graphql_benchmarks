defmodule Mix.Tasks.Benchmark do
  use Mix.Task
  @shortdoc "Runs the benchmarks"

  @all_fields """
    query($count: Int!) {
      foos(count: $count) {
        id
        int1
        int2
        string1
        string2
        boolean1
        boolean2
        stringArray
        intArray
        booleanArray
      }
    }
  """

  @no_arrays """
    query($count: Int!) {
      foos(count: $count) {
        id
        int1
        int2
        string1
        string2
        boolean1
        boolean2
      }
    }
  """

  @only_id """
    query($count: Int!) {
      foos(count: $count) {
        id
      }
    }
  """

  def run(_) do
    Benchee.run(%{
      "All Fields 10" => fn -> execute(@all_fields, 10) end,
      "All Fields 100" => fn -> execute(@all_fields, 100) end,
      "All Fields 1000" => fn -> execute(@all_fields, 1000) end,
      "All Fields 10000" => fn -> execute(@all_fields, 10000) end,
      "No Arrays 10" => fn -> execute(@no_arrays, 10) end,
      "No Arrays 100" => fn -> execute(@no_arrays, 100) end,
      "No Arrays 1000" => fn -> execute(@no_arrays, 1000) end,
      "No Arrays 10000" => fn -> execute(@no_arrays, 10000) end,
      "Only ID 10" => fn -> execute(@only_id, 10) end,
      "Only ID 100" => fn -> execute(@only_id, 100) end,
      "Only ID 1000" => fn -> execute(@only_id, 1000) end,
      "Only ID 10000" => fn -> execute(@only_id, 10000) end
    })
  end

  defp execute(query, count), do: Absinthe.run(query, Schema, variables: %{"count" => count})
end
