defmodule SegmentChallenge.CommandsTest do
  use ExUnit.Case
  doctest SegmentChallenge.Commands

  test "greets the world" do
    assert SegmentChallenge.Commands.hello() == :world
  end
end
