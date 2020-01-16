defmodule DayOne do
  Code.require_file("./puzzle_input.ex", __DIR__)

  def calculate! do
    # IO.inspect(part_one())
    IO.inspect(part_two())
  end

  def part_one do
    puzzle_input()
    # calculates fuel cost
    |> Enum.map(&module_weight_fuel_cost/1)
    # sums fuel cost
    |> Enum.sum()
  end

  def part_two do
  end

  defp module_weight_fuel_cost(mass) do
    # returns int
    div(mass, 3)
    # subs 2
    |> subtract_2()
    # compares result to 0 and return max
    |> max(0)
  end

  defp subtract_2(num), do: num - 2

  defp puzzle_input do
    PuzzleInput.module_masses()
  end
end
