# HelloElixir - Learning Notes

## Project Structure

```
hello_elixir/
├── _build/          # Compiled output (like node_modules/.cache or dist/)
├── lib/             # Source code (like src/)
│   └── hello_elixir.ex
├── test/            # Tests (like __tests__/ or test/)
├── .formatter.exs   # Code formatter config (like .prettierrc)
├── mix.exs          # Project config (like package.json)
└── README.md
```

## Key Files

| Elixir | Node.js Equivalent |
|--------|-------------------|
| `mix.exs` | `package.json` |
| `mix.lock` | `package-lock.json` |
| `/deps` | `/node_modules` |
| `/_build` | `/dist` or `/build` |

## File Extensions

- `.ex` - Compiled code (your actual application)
- `.exs` - Script files (config, tests - like `.mjs` for scripts)

---

## Elixir vs JavaScript Concepts

### 1. Atoms (`:atom`)

Atoms are constants where the name IS the value. They're immutable and unique.

```elixir
# Elixir
:ok
:error
:hello_world
```

```javascript
// JavaScript equivalent - Symbols or string constants
const OK = Symbol('ok')
// or
const STATUS = { OK: 'ok', ERROR: 'error' }
```

**Common uses:**
```elixir
# Return values (instead of throwing errors)
{:ok, result}
{:error, "something went wrong"}

# Like JS: { status: 'ok', data: result }
```

### 2. Modules & `use`

```elixir
# Elixir
defmodule HelloElixir.MixProject do
  use Mix.Project      # Injects code/macros into this module
end
```

```javascript
// JavaScript equivalent
class MixProject extends Mix.Project {  // roughly like inheritance
  // use = injects methods, macros, and behaviors
}

// or with mixins
Object.assign(MixProject.prototype, Mix.Project)
```

**`use` vs `import` vs `alias`:**

```elixir
# use - injects code into your module (like extending a class)
use ExUnit.Case

# import - brings functions into scope (like JS import)
import Enum, only: [map: 2, filter: 2]

# alias - shortens module names
alias MyApp.Accounts.User, as: User
```

```javascript
// JS equivalents
import { map, filter } from 'lodash'      // import
import User from './accounts/user'         // alias
```

### 3. Functions

```elixir
# Elixir
def hello do          # public function
  :world
end

defp private_fn do    # private function (defp)
  "can't call from outside"
end
```

```javascript
// JavaScript
export function hello() {    // public
  return 'world'
}

function privateFn() {       // private (not exported)
  return "can't call from outside"
}
```

### 4. Pattern Matching

```elixir
# Elixir - pattern matching (VERY powerful)
{:ok, user} = get_user(1)    # extracts user if status is :ok
[head | tail] = [1, 2, 3]    # head = 1, tail = [2, 3]
```

```javascript
// JavaScript - destructuring (similar but less powerful)
const { status, user } = getUser(1)
const [head, ...tail] = [1, 2, 3]
```

### 5. Pipe Operator

```elixir
# Elixir - pipe operator |>
"hello world"
|> String.upcase()
|> String.split(" ")
# => ["HELLO", "WORLD"]
```

```javascript
// JavaScript - method chaining or proposed pipeline
"hello world"
  .toUpperCase()
  .split(" ")
```

### 6. Lists & Maps

```elixir
# Elixir
list = [1, 2, 3]                    # linked list
map = %{name: "John", age: 30}      # map (like object)
map.name                            # => "John"
```

```javascript
// JavaScript
const list = [1, 2, 3]              // array
const map = { name: "John", age: 30 }
map.name                            // => "John"
```

### 7. Anonymous Functions

```elixir
# Elixir
add = fn a, b -> a + b end
add.(1, 2)                    # Note the dot! => 3

# Shorthand
add = &(&1 + &2)
```

```javascript
// JavaScript
const add = (a, b) => a + b
add(1, 2)                     // => 3
```

---

## Mix Commands (like npm scripts)

| Mix Command | npm Equivalent |
|-------------|----------------|
| `mix new app` | `npm init` |
| `mix deps.get` | `npm install` |
| `mix compile` | `npm run build` |
| `mix test` | `npm test` |
| `mix format` | `npm run prettier` |
| `iex -S mix` | `node` (REPL with project loaded) |

---

## Quick Reference

```elixir
# Module definition
defmodule MyModule do
  # Module attribute (like class constant)
  @default_value 42

  # Public function
  def my_function(arg) do
    arg + @default_value
  end

  # Private function
  defp helper do
    "internal use only"
  end
end

# Calling functions
MyModule.my_function(8)  # => 50
```

---

## Running the Project

```bash
# Start interactive shell
iex -S mix

# Then call your function
iex> HelloElixir.hello()
:world

# Run tests
mix test
```

---

## Notes: Table of Contents

### [1. Elixir Struct Syntax](notes/1-Elixir-Struct-Syntax.md)

