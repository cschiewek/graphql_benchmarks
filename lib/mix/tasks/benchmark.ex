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
    inputs = %{
      "All Fields" => @all_fields,
      "No Arrays" => @no_arrays,
      "Only ID" => @only_id
    }
    functions = %{
      "10" => &execute(&1, 10),
      "100" => &execute(&1, 100),
      "1000" => &execute(&1, 1000),
      "10000" => &execute(&1, 10000)
    }
    Benchee.run(functions, inputs: inputs)
  end

  defp execute(query, count), do: Absinthe.run(query, Schema, variables: %{"count" => count})
end
