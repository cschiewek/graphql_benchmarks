defmodule GraphqlBenchmarksTest do
  use ExUnit.Case
  doctest GraphqlBenchmarks

  test "greets the world" do
    assert GraphqlBenchmarks.hello() == :world
  end
end
