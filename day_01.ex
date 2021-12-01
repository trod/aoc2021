defmodule DeepMeasure do
  def prepare_input() do
    File.stream!("input.txt")
    |> Enum.map(fn line ->
      line |> String.trim_trailing("\n") |> String.to_integer()
    end)
  end

  def solution_1() do
    {_, count} =
      prepare_input()
      |> Enum.reduce(
        {0, -1},
        fn x, {prev, counter} ->
          if x > prev do
            {x, counter + 1}
          else
            {x, counter}
          end
        end
      )
    count
  end

  def solution_2() do
    {_, _, count} =
      prepare_input()
      |> Enum.reduce(
        {{0, 0}, 0, -3},
        fn x, {{prev_a, prev_b}, sum, counter} ->
          if x + prev_a + prev_b > sum do
            {{prev_b, x}, x + prev_a + prev_b, counter + 1}
          else
            {{prev_b, x}, x + prev_a + prev_b, counter}
          end
        end
      )
    count
  end
end
