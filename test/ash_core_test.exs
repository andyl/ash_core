defmodule AshCoreTest do
  use ExUnit.Case
  doctest AshCore

  test "greets the world" do
    assert AshCore.hello() == :world
  end
end
