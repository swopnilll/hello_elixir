defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter(grid, fn {code, _index} ->
      rem(code, 2) == 0
    end)

    %Identicon.Image{image | grid: grid}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten()
      |> Enum.with_index()

    %Identicon.Image{image | grid: grid}
  end

  def mirror_row(row) do
    # [145,46,200]
    [first, second | _rest] = row

    row ++ [second, first]
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _rest]} = image) do
    # hex = image["hex"] # Wrong - structs don't support bracket access
    # hex = image.hex
    # hex

    # %Identicon.Image{hex: hex_list} = image
    # [r,g,b | _rest] = hex_list
    # [r,g,b]

    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hexVal =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hexVal}
  end
end
