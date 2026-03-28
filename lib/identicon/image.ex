defmodule Identicon.Image do
  defstruct hex: nil, color: nil, grid: nil, pixel_map: nil
end

# hex - List [230, 249, 195, 71, 103, 45, 170, 229, 162, 85, 122, 225, 24, 244, 74, 30]
# colod - tuple {230, 249, 195}
# grid -  List of Tuple [
  #   {230, 0},
  #   {230, 4},
  #   {170, 10},
  #   {162, 12},
  #   {170, 14},
  #   {122, 16},
  #   {122, 18},
  #   {24, 20},
  #   {244, 21},
  #   {74, 22},
  #   {244, 23},
  #   {24, 24}
  # ]
# pixel_map
