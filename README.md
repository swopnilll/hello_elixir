# Learning Elixir

A hands-on journey through Elixir's patterns, syntax, and functional programming concepts by building real projects.

> **Course Reference**: These notes are from [The Complete Elixir and Phoenix Bootcamp](https://www.udemy.com/course/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/) on Udemy. Highly recommended for learning Elixir from scratch. This repository serves as my personal revision notes.

---

## Approach

We learn Elixir by **building projects**. Each project introduces new concepts:

| Project | What We Learn |
|---------|---------------|
| **Cards Game** | Pattern matching, pipe operator, atoms, error handling, file I/O |
| **Identicon Generator** | Structs, maps, lists, more syntax patterns |

---

## Reference Notes

- [Elixir Struct Syntax](notes/1-Elixir-Struct-Syntax.md)
- [Lists in Elixir](notes/3-Elixir-List.md)
- [CLI Command Parser](notes/2-CLI-command-parser.md)

---

## Project 1: Cards Game

A simple card game that teaches core Elixir concepts.

### Setup
- [1.1 Intro](notes/cards/1.md)
- [1.2 Mix Intro](notes/cards/2.md)

### Pattern Matching & Core Concepts
- [1.3 Elixir File System + Erlang + BEAM](notes/pattern-match/2.md)
- [1.4 Saving Data in Elixir (Using Erlang)](notes/pattern-match/3.md)
- [1.5 Loading Data + Pattern Matching + Error Handling](notes/pattern-match/4.md)
- [1.6 Atoms + Advanced Pattern Matching + Clean Case](notes/pattern-match/5.md)
- [1.7 Pipe Operator](notes/pattern-match/6.md)
- [1.8 Pipe Operator (|>) Deep Dive](notes/pattern-match/7.md)
- [1.9 Summary](notes/pattern-match/8.md)

### Data Structures
- [1.10 Maps in Elixir](notes/pattern-match/9.md)
- [1.11 Maps (Write Operations)](notes/pattern-match/10.md)
- [1.12 Keyword Lists](notes/pattern-match/11.md)

---

## Project 2: Identicon Generator

Generate unique identicon images (like GitHub's default avatars) from strings. This project focuses on Elixir syntax, structs, maps, and lists.

### Setup & Planning
- [2.1 Project Setup](notes/identication/1.md)
- [2.2 Requirements & Flow](notes/identication/2.md)
- [2.3 MD5 Hashing Approach](notes/identication/3.md)
- [2.4 Hash Function & Grid Logic](notes/identication/4.md)

### Data Structures
- [2.5 Structs in Elixir](notes/identication/5.md)
- [2.6 Pattern Matching with Structs & Lists](notes/identication/6.md)

### Building the Grid
- [2.7 Enum.chunk & Grid Building](notes/identication/7.md)
- [2.8 Implementing mirror_row & ++ Operator](notes/identication/8.md)
- [2.9 Enum.map & Function References (&func/arity)](notes/identication/9.md)
- [2.10 List.flatten, Enum.with_index & Updating Structs](notes/identication/10.md)
- [2.11 Enum.filter, Anonymous Functions (fn) & rem](notes/identication/11.md)

### Rendering the Image
- [2.12 Building the Pixel Map (Index to Coordinates)](notes/identication/12.md)

---

## Quick Reference

```elixir
# Pipe Operator
"input" |> hash_input |> pick_color |> build_grid |> render_image

# Pattern Matching
{:ok, result} = some_function()

# Structs
%Identicon.Image{hex: [145, 46, 200, ...], color: {145, 46, 200}}
```
