defmodule SegmentChallenge.Projections.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: SegmentChallenge.Projections.Worker.start_link(arg)
      # {SegmentChallenge.Projections.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SegmentChallenge.Projections.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
