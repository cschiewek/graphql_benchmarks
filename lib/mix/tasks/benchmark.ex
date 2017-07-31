defmodule Mix.Tasks.Benchmark do
  use Mix.Task
  @shortdoc "Runs the benchmarks"

  def run(_) do
    {:ok, results} = """
    {
      foos(count: 1) {
        id
      }
    }
    """
    |> Absinthe.run(Schema)

    IO.puts inspect(results)
  end
end
