https://10consulting.com/2017/01/04/building-a-cqrs-web-application-in-elixir-using-phoenix/

## Theory

### Command Query Responsibility Segregation (CQRS)

CQRS = separation OF: 
**Commands** (update **write model**)
*register account; transfer funds; mark fraudulent activity*
FROM
**Queries** (retrieve a value from a **read model**)
*account registered; funds transferred; fraudulent activity detected*

Read and write model use different database, or storage mechanisms.

Domain events from the **write model** are used to update the **read model**.

The **read model** is optimised for querying, using whatever technology is most appropriate: relational database; in-memory store; NoSQL database; full-text search index.

```
Commands 
    do   ---update----> Write model (insert Domain events in EventStore)
    they ---update----> Read model
    it   ---is used for----> Queries
```

### Event sourcing
Application state changes are modelled as domain events.
They are persisted in order – as a logical stream – for each aggregate. An aggregate’s current state is built by replaying its domain events.

Example:
```
-> item added to cart
    -> item removed from cart
        -> item added to cart
```

### Benefits
- independent scaling of read & write models
- easy integration with new services
  (by replaying and projecting all events)

### Costs
- events are immutable, design mistakes are costly
- eventual consistency

## Implementation

Required parts:
- A domain model containing our **aggregates**, **commands**, and **domain events**.
- Hosting of an **aggregate root** and a way to send it commands.
- Write model's **event store** to persist the domain events.
- **Read model store** for querying.
- **Event handlers** to build and update the read model.
- A web **front-end UI** to
    - display read model data
    - dispatch commands to the write model

EventStore (Commanded.EventStore) api allows:
- append new events (store in database)
- replay all events
- subscribe to new events
