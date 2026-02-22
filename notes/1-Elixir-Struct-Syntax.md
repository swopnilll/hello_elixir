# Data Model
What we're creating: A Task blueprint - like a TypeScript interface or MongoDB schema.

## Step 1: Create the file
```zsh
nano lib/task_manager/task.ex
```

## Step 2: code

```elixir
defmodule HelloElixir.Task do
    defstruct [:id, :title, :completed, :created_at]
end
```

## Step 3: Test it works (Elixir REPL)

```zsh
iex -S mix
```

### In IEx, type these lines one-by-one:

```elixir
# SYNTAX #1: Empty task (all fields = nil)
%TaskManager.Task{}
```

```elixir
%TaskManager.Task{
  id: nil,
  title: nil, 
  completed: nil,
  created_at: nil
}
```

```elixir
# SYNTAX #2: Create with values (Node.js equivalent)
task1 = %TaskManager.Task{
  id: 1,
  title: "Buy milk",
  completed: false,
  created_at: DateTime.utc_now()
}
```

```elixir
# SYNTAX #3: Pattern matching destructuring (ELIXIR MAGIC)
%TaskManager.Task{title: title} = task1
title
# => "Buy milk"
```

```elixir
# SYNTAX #4: Update (IMMUTABLE - new copy)
completed_task = %{task1 | completed: true}
```

## Elixir Syntax You Just Learned ✅


| Elixir Syntax | What it Does | Node.js Equivalent |
|---------------|--------------|--------------------|
| `defmodule` | Define a module | `class` / `const` |
| `defstruct [:id, :title]` | Define data shape | `interface` / `type` |
| `%Task{}` | Create struct | `new Task()` |
| `%Task{field: value}` | Create + set fields | Object literal |
| `%{task \| field: value}` | Immutable update | `Object.assign({}, ...)` |
| `%Task{title: title} = task` | Pattern matching | `const { title } = task` |

---

## Key Takeaways (vs Node.js)
- ✅ NO "new" keyword
- ✅ NO "this" confusion
- ✅ NO mutable state bugs
- ✅ Compiler checks field names
- ✅ Pattern matching = destructuring on steroids

