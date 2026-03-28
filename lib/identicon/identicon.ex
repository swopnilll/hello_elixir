defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
    |> draw_image(input)
  end

  def draw_image(%Identicon.Image{pixel_map: pixel_map, color: color}, input) do
    {r, g, b} = color
    filename = "#{input}.png"

    # Build the ImageMagick draw commands for all rectangles
    draw_commands =
      pixel_map
      |> Enum.map(fn {{x1, y1}, {x2, y2}} ->
        "rectangle #{x1},#{y1} #{x2},#{y2}"
      end)
      |> Enum.join(" ")

    %Mogrify.Image{path: filename, ext: "png"}
    |> Mogrify.custom("size", "250x250")
    |> Mogrify.canvas("white")
    |> Mogrify.custom("fill", "rgb(#{r},#{g},#{b})")
    |> Mogrify.custom("draw", draw_commands)
    |> Mogrify.create(path: ".")

    "Image generated: #{filename}"
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    # [{230,0},{230, 4},{170, 10}, {162, 12},{170, 14},{122, 16},{122, 18},{24, 20},{244, 21}, {74, 22}, {244, 23},{24, 24}]

    # For each {code, index} in grid:
    # Calculate top_left and bottom_right coordinates
    # Store as pixel_map in struct

    pixel_map =
      Enum.map(grid, fn {_code, index} ->
        horizontal = rem(index, 5) * 50
        vertical = div(index, 5) * 50

        top_left = {horizontal, vertical}
        bottom_right = {horizontal + 50, vertical + 50}

        {top_left, bottom_right}
      end)

    %Identicon.Image{image | pixel_map: pixel_map}
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    # [{230,0},{249,1},{195,2},{249, 3},{71, 5}, .................................................................{24, 24}]

    grid =
      Enum.filter(grid, fn {code, _index} ->
        rem(code, 2) == 0
      end)

    # [{230,0},{230, 4},{170, 10}, {162, 12},{170, 14},{122, 16},{122, 18},{24, 20},{244, 21}, {74, 22}, {244, 23},{24, 24}]

    %Identicon.Image{image | grid: grid}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      # [ [230, 249, 195], [71, 103, 45], [170, 229, 162], [85, 122, 225], [24, 244, 74] ]
      |> Enum.map(&mirror_row/1)
      # [ [230, 249, 195, 249, 230], ...., [24, 244, 74, 244, 24] ]
      |> List.flatten()
      # [230, 249, 195, 249, 230, 71, 103, 45, 103, 71, 170, 229, 162, 229, 170, 85, 122, 225, 122, 85, 24, 244, 74, 244, 24]
      |> Enum.with_index()

    # [{230,0},{249,1},{195,2},{249, 3},{71, 5}, .................................................................{24, 24}]

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

    # Map.put(image, :color, {r, g, b})
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hexVal =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    # IO.inspect(hexVal, label: HexValue)
    # Elixir.HexValue: [230, 249, 195, 71, 103, 45, 170, 229, 162, 85, 122, 225, 24, 244, 74, 30]

    %Identicon.Image{hex: hexVal}
  end
end
