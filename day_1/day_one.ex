defmodule DayOne do
  Code.require_file("./puzzle_input.ex", __DIR__)

  def calculate! do
    IO.inspect(part_one())
    IO.inspect(part_two())
  end

  def part_one do
    puzzle_input()
    # calculates fuel cost
    |> Enum.map(&fuel_cost/1)
    # sums fuel cost
    |> Enum.sum()
  end

  def part_two do
    puzzle_input()
    |> Enum.map(&fuel_cost_precise/1)
    |> Enum.sum()
  end

  # if the max result was 0, sum the acc
  defp fuel_cost_precise(0, acc), do: Enum.sum(acc)
  # intial entry
  defp fuel_cost_precise(mass), do: fuel_cost_precise(mass, [])

  defp fuel_cost_precise(mass, acc) do
    result = fuel_cost(mass)
    fuel_cost_precise(result, [result | acc])
  end

  defp fuel_cost(mass) do
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
