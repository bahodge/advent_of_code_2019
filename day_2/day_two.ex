defmodule DayTwo do
  Code.require_file("./puzzle_input.ex", __DIR__)

  def calculate! do
    part_one()
  end

  def part_one do
    test_program()
    |> compile_program()
    |> execute_program()
  end

  def execute_program(program) do
    IO.inspect(program)
    program_set = get_next(program)

    case perform_operation(program, program_set) do
      {:halt, finished_program} ->
        IO.puts("ENDING PROGRAM")
        read(finished_program, 0)

      updated_program ->
        execute_program(updated_program)
    end
  end

  def perform_operation(program, [instruction_key | address_values]) do
    instruction = get_instruction(instruction_key)
    instruction.(program, address_values)
  end

  def get_next(program) do
    addresses =
      program.read_head..(program.read_head + 3)
      |> Enum.map(& &1)

    Map.take(program.memory, addresses)
    |> Map.to_list()
    |> Enum.map(fn {_idx, val} -> val end)
  end

  def get_instruction(instruction_key) do
    Map.fetch!(instruction_set(), instruction_key)
  end

  def instruction_set do
    %{1 => &add/2, 99 => &hcf/2, 2 => &multiply/2}
  end

  def read(program, address) do
    Map.fetch!(program.memory, address)
  end

  def write(program, address, value) do
    result = Map.put(program.memory, address, value)

    %{program | memory: result}
  end

  def update_read_head(program) do
    Map.put(program, :read_head, program.read_head + 4)
  end

  def hcf(program, _addresses), do: {:halt, program}

  def add(program, addresses) do
    [addr_1, addr_2, addr_3] = addresses

    val_1 = read(program, addr_1)
    val_2 = read(program, addr_2)

    write(program, addr_3, val_1 + val_2)
    |> update_read_head()
  end

  def multiply(program, addresses) do
    [addr_1, addr_2, addr_3] = addresses

    val_1 = read(program, addr_1)
    val_2 = read(program, addr_2)

    write(program, addr_3, val_1 * val_2)
    |> update_read_head()
  end

  # transform into map w/ index & value
  def compile_program(program) do
    memory =
      program
      # Get index
      |> Stream.with_index()
      # Flip result
      |> Stream.map(fn {val, idx} -> {idx, val} end)
      # Put into map
      |> Map.new()

    %{memory: memory, read_head: 0}
  end

  def test_program do
    [1, 1, 1, 4, 99, 5, 6, 0, 99]
    |> Stream.map(& &1)
  end

  def puzzle_program do
    Puzzleprogram.intcode()
    |> Stream.map()
  end
end
