# SegmentChallenge

Main Application is **challenges**. It contains domain-specific logic (Athletes, Challenges, Clubs, Leaderboards, Stages).
Application structure should be about 
it's **INTENT**, not technology (e.g. projections, queries, tasks), or delivery mechanism. (more by Uncle Bob: [Architecture the lost years](https://www.youtube.com/watch?v=WpkDN78P884))

Umbrella apps
- **authorisation** - policies to authorise command dispatch
- **challenges**
    - core domain model
    - **aggregates***
    - command router
    - **process managers***
    - read model projections
    - queries
    - periodic tasks

- **commands** - Modules (structs) for each command (e.g. `SegmentChallenge.Commands.ApproveChallenge`).
- **events** - Modules (structs) for each domain event (e.g. `SegmentChallenge.Events.ChallengeApproved`).
- **infrastructure** - Serialization and command middleware.
- **projections** - Ecto repository and database migrations to build the read model database schema.
- **web** (Phoenix front-end)
    - router
    - controllers
    - plugs
    - templates
    - views
    - static assets

**aggregates***:
Aggregate root must conform to the following behaviour to implement the event sourcing pattern:
- Each public function must accept a command and return any resultant domain events, or an error.
- Its internal state may only be modified by applying a domain event to its current state.
- Its internal state can be rebuilt from an initial empty state by replaying all domain events in the order they were created.

**process managers***:
Orchestrate **aggregate roots**.
It's opposite of aggregate - process managers handle events and create commands.

Commands -> Events -> Process manager -> Commands -> Events

Commanded.ProcessManagers.ProcessManager behaviour

Examples:
- tracking club members to:
    - include them in challenges 
    - include them in active stages hosted by the club
- based on stage rank at the end of the stage
    - apply scores
    - update the overall challenge leaderboards

```elixir
defmodule ExampleProcessManager do
  use Commanded.ProcessManagers.ProcessManager,
    application: ExampleApp,
    name: "ExampleProcessManager"

  def interested?(%AnEvent{uuid: uuid}), do: {:start, uuid}

  def handle(%ExampleProcessManager{}, %ExampleEvent{}) do
    [
      %ExampleCommand{}
    ]
  end

  def error({:error, failure}, %ExampleEvent{}, _failure_context) do
    # Retry, skip, ignore, or stop process manager on error handling event
  end

  def error({:error, failure}, %ExampleCommand{}, _failure_context) do
    # Retry, skip, ignore, or stop process manager on error dispatching command
  end
end
```