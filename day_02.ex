defmodule Day02 do
  def prepare_input() do
    File.stream!("input.txt")
    |> Enum.map(fn line ->
      line |> String.trim_trailing("\n")
    end)
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [type, value] ->
      {String.to_existing_atom(type), value |> String.to_integer()}
    end)
  end

  def solution_1() do
    {depth, hor} =
      prepare_input()
      |> Enum.reduce({0, 0}, fn
        {:forward, value}, {depth, hor} -> {depth, hor + value}
        {:down, value}, {depth, hor} -> {depth - value, hor}
        {:up, value}, {depth, hor} -> {depth + value, hor}
      end)

    abs(depth) * abs(hor)
  end

  @spec solution_2 :: number
  def solution_2() do
    {depth, hor, _aim} =
      prepare_input()
      |> Enum.reduce({0, 0, 0}, fn
        {:forward, value}, {depth, hor, aim} -> {depth + (aim * value), hor + value, aim}
        {:down, value}, {depth, hor, aim}  -> {depth, hor, aim + value}
        {:up, value}, {depth, hor, aim} -> {depth, hor, aim - value}
      end)

    abs(depth) * abs(hor)
  end
end
