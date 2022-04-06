# PR Checklist

- Low Hanging Fruit
  - Does it Build?
  - Does it Run?
  - Do the tests pass?
  - Does it have docstrings?
  - Is there any dead code?
- Design
  - Is it semantic?
  - Is it better?
  - Is it consistent with the codebase?
  - Is this a good time for the change?
- Functionality
  - Does it work as intended?
  - Do the tests work as intended?
  - How does it handle edge cases?
  - Do try-except blocks swallow errors?
  - Are there any concurrency issues?
    - Temporary Update
    - Incorrect Summary
    - Lost Update
    - Unrepeatable Read
    - Phantom Read
- Complexity
  - Are there simpler solutions to any line?
  - Is it easy to follow?
  - Are there redundant checks?
- Consistency
  - Is there a style guide?
  - Differences in line lengths?
  - Docstring formatting?
- Comments
  - Easy to understand?
  - Unambiguous?
  - Necessary?
  - Do they record _intent_ and _decisions_?
- Line by Line

# concurrency

## Concurrency Problems

### Temporary Update Problem

A updates X but then fails. Before X is reverted, B reads from X.

#### Solution

- A works on a local copy of X, updating the original only on its completion.
- locks

### Incorrect Summary Problem

A aggregates X[] while B updates it, causing the aggregated value to be incorrect.

#### Solution

- A works on a local copy of X, which is discarded.
- locks

### Lost Update Problem

A and B both read from X, then try to write back `X=X+10`. Whichever gets there first will have its change overwritten by the latter.

#### Solution

- locks

### Unrepeatable Read Problem

B reads from X at two points in a given iteration. Between these points, A updates X, causing X's value to be inconsistent during the execution of B.

#### Solution

- ensure any transaction reads any variable only once then works on a local copy.
- locks

### Phantom Read Problem

B reads from X at two points in a given iteration. Between these points, A deletes X, causing an error on the second read.

- ensure any transaction reads any variable only once then works on a local copy.
- locks

## Solving Concurrecny Problems

### Pessimistic Locking

"I'm using this, don't let anyone else have it"

- long time out periods are a problem

### Read before Write

Keep an unaltered copy of the original read.

Before writing an updated version back to the source, take a second read and compare it to the stored copy. Refuse the write if the copies differ.

### Timestamping

Each record has a 'last updated' field. Works just like Read before Write but you only need to store the last_updated parameter, not the whole record.
