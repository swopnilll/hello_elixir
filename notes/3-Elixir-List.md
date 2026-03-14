# Understanding Prepending vs Appending in Elixir (For JavaScript Developers)

This guide explains **how lists work in Elixir**, especially the difference between **prepending** and **appending** items.

If you are coming from **JavaScript**, the behaviour may feel unusual at first because **Elixir lists are linked lists**, not arrays.

---

# 1. First: How Lists Work in JavaScript

In JavaScript, arrays are stored in **contiguous memory**.

Example:

```javascript
let list = ["n1","n2","n3","n4","n5"]
```

Memory representation (conceptually):

```
Index:   0    1    2    3    4
Value:  n1   n2   n3   n4   n5
```

When we append:

```javascript
list.push("n6")
```

Result:

```
[n1, n2, n3, n4, n5, n6]
```

The engine usually just writes `n6` to the next memory slot.

Cost:

```
O(1)
```

---

# 2. How Lists Work in Elixir

Elixir lists are **linked lists**.

Each item contains:

```
[value | pointer_to_next]
```

Example list:

```elixir
["n1","n2","n3","n4","n5"]
```

Internally:

```
HEAD
 ↓
 n1 → n2 → n3 → n4 → n5 → nil
```

Each node points to the next node.

```
n1 -> points to n2
n2 -> points to n3
n3 -> points to n4
n4 -> points to n5
n5 -> points to nil
```

The **HEAD** is the start of the list.

---

# 3. Prepending in Elixir (Adding to the Front)

Prepending means **adding an element to the front of the list**.

Elixir syntax:

```elixir
[new_item | list]
```

Example:

```elixir
list = ["n1","n2","n3","n4","n5"]

list = ["n0" | list]
```

Result:

```
n0 → n1 → n2 → n3 → n4 → n5
```

Important idea:

We **do not modify the old list**.

Instead we create a **new head node**.

Old list:

```
HEAD
 ↓
 n1 → n2 → n3 → n4 → n5
```

New list:

```
HEAD
 ↓
 n0 → n1 → n2 → n3 → n4 → n5
```

Only **one node is created**.

Cost:

```
O(1)
```

This is why **prepending is very fast in Elixir**.

---

# 4. Building a List by Prepending

Let us build a LinkedIn-style connection list:

```
n1 n2 n3 n4 n5
```

Start with an empty list.

```elixir
list = []
```

Explanation:

```
[] means empty list
```

---

Add `n1`:

```elixir
list = ["n1" | list]
```

Result:

```
n1
```

---

Add `n2`:

```elixir
list = ["n2" | list]
```

Result:

```
n2 → n1
```

---

Add `n3`:

```
n3 → n2 → n1
```

---

Add `n4`:

```
n4 → n3 → n2 → n1
```

---

Add `n5`:

```
n5 → n4 → n3 → n2 → n1
```

Notice the list becomes **reversed**.

---

# 5. Fixing the Order

We reverse the list once.

```elixir
Enum.reverse(list)
```

Explanation:

```
Enum = module with functions for working with collections
reverse = function that reverses the list
```

Result:

```
n1 → n2 → n3 → n4 → n5
```

Cost:

```
O(n)
```

---

# 6. Appending in Elixir

Appending means **adding an element to the end**.

Elixir uses the `++` operator.

Example:

```elixir
["n1","n2","n3"] ++ ["n4"]
```

Result:

```
n1 → n2 → n3 → n4
```

But internally something important happens.

Original list:

```
n1 → n2 → n3 → nil
```

New list created:

```
n1' → n2' → n3' → n4 → nil
```

Why?

Because Elixir **cannot modify existing nodes**.

So it must:

```
copy n1
copy n2
copy n3
attach n4
```

Cost:

```
O(n)
```

---

# 7. Example Using a Loop (The Wrong Way)

Example code:

```elixir
list = []

for i <- 1..5 do
  list = list ++ [i]
end
```

Let's explain the syntax.

### `list = []`

Creates an empty list.

---

### `1..5`

Range from 1 to 5.

```
1,2,3,4,5
```

---

### `i <- 1..5`

Means:

```
for each value in 1..5 assign it to variable i
```

Similar to JavaScript:

```javascript
for (let i = 1; i <= 5; i++)
```

---

### `list ++ [i]`

This means:

```
append element i to list
```

Example when `i = 3`:

```
[1,2] ++ [3]
```

---

# 8. Why This Becomes Slow

Step 1

```
[] ++ [1]
```

Step 2

```
[1] ++ [2]
```

Step 3

```
[1,2] ++ [3]
```

Step 4

```
[1,2,3] ++ [4]
```

Step 5

```
[1,2,3,4] ++ [5]
```

Each step copies the entire list.

Total work done:

```
0 + 1 + 2 + 3 + 4
```

Which equals:

```
O(n²)
```

So this approach becomes slow for large lists.

---

# 9. The Correct Elixir Approach

Instead of appending, we prepend.

Example using a loop-like pattern:

```elixir
list = []

list = [1 | list]
list = [2 | list]
list = [3 | list]
list = [4 | list]
list = [5 | list]

list = Enum.reverse(list)
```

Result:

```
[1,2,3,4,5]
```

Total cost:

```
O(n)
```

---

# 10. Key Takeaways

### JavaScript Arrays

```
append → fast
prepend → slow
```

---

### Elixir Lists

```
prepend → fast
append → slow
```

---

### Golden Rule in Elixir

Never repeatedly grow a list with `++` inside loops.

Instead:

```
prepend items
then reverse once
```

This keeps your program **O(n)** instead of **O(n²)**.
