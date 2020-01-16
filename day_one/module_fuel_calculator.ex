defmodule ModuleFuelCalculator do
  def calculate! do
    puzzle_input |> calculate_all_fuel
  end

  defp calculate_all_fuel(list), do: calculate_all_fuel(list, 0)
  defp calculate_all_fuel([], total), do: total

  defp calculate_all_fuel([head | tail], total) do
    calculate_all_fuel(tail, total + calculate_module_fuel(head))
  end

  defp calculate_module_fuel, do: 0

  defp calculate_module_fuel(mass) do
    div(mass, 3)
    |> subtract_2
  end

  defp subtract_2(num), do: num - 2

  defp puzzle_input do
    [
      137_654,
      50175,
      66976,
      57860,
      83790,
      54910,
      54619,
      116_199,
      143_411,
      51671,
      115_872,
      71948,
      148_635,
      92858,
      90939,
      127_238,
      127_895,
      124_557,
      78529,
      55785,
      61550,
      138_304,
      128_465,
      74497,
      136_583,
      66010,
      64320,
      91234,
      51418,
      90761,
      136_134,
      66312,
      135_172,
      126_256,
      54124,
      53174,
      72252,
      145_546,
      80950,
      52271,
      118_231,
      79687,
      106_127,
      108_233,
      69510,
      124_533,
      105_202,
      54861,
      103_087,
      81646,
      107_634,
      105_240,
      137_434,
      60812,
      90066,
      149_325,
      117_535,
      107_526,
      50814,
      51850,
      90707,
      110_908,
      51739,
      96373,
      91987,
      144_389,
      75682,
      142_954,
      83555,
      93320,
      101_914,
      117_640,
      109_401,
      106_950,
      54521,
      130_826,
      109_942,
      55360,
      105_653,
      92168,
      149_572,
      79571,
      88590,
      104_400,
      109_598,
      51623,
      86649,
      143_689,
      88350,
      143_809,
      50119,
      75616,
      86361,
      76884,
      62339,
      83118,
      76847,
      137_105,
      130_460,
      54479
    ]
  end
end
