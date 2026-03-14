defmodule HelloElixir.CLI do
  @moduledoc """
  Command line interface for the Task Manager application.
  """

  # Public Entry point for the CLI
  def parse(line) when is_binary(line) do
    line
    |> String.trim()
    |> String.split(~r/\s+/, parts: 2)
    |> do_parse()
  end

  # Private pattern-matching handlers


  # "add Some title
  defp do_parse(["add", title]) when byte_size(title) > 0 do
    {:add, title}
  end

  # "list"
  defp do_parse(["list"]) do
    :list
  end

  # "complete 3"
  defp do_parse(["complete", id_str]) do
    case Integer.parse(id_str) do
      {id, ""} -> {:complete, id}
      _ -> {:error, :invalid_id}
    end
  end

  # "help"
  defp do_parse(["help"]) do
    :help
  end

  # Empty Input
  defp do_parse([""]) do
    :empty
  end

  # Anything Else
  defp do_parse(_other) do
    {:error, :unknown_command}
  end
end
