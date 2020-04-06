defmodule SegmentChallenge.Commands do
  @moduledoc """
  Documentation for `SegmentChallenge.Commands`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SegmentChallenge.Commands.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule SegmentChallenge.Commands.StartChallenge do
  defstruct [
    :challenge_uuid,
  ]

  use Vex.Struct

  validates :challenge_uuid, uuid: true
end
