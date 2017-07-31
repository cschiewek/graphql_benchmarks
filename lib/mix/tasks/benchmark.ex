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
    {:ok, results} = Absinthe.run(@all_fields, Schema, variables: %{"count" => 1000})
    IO.puts results
  end
end
