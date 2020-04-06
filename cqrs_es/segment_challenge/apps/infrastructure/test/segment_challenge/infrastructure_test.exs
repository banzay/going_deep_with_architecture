defmodule SegmentChallenge.InfrastructureTest do
  use ExUnit.Case
  doctest SegmentChallenge.Infrastructure

  test "greets the world" do
    assert SegmentChallenge.Infrastructure.hello() == :world
  end
end
