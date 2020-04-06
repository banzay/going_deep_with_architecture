defmodule SegmentChallenge.Events do
  @moduledoc """
  Documentation for `SegmentChallenge.Events`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SegmentChallenge.Events.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule SegmentChallenge.Events.ChallengeStarted do
  defstruct [
    :challenge_uuid,
    :start_date,
    :start_date_local,
  ]
end
