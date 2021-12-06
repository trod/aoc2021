defmodule Day03 do
  @length 11
  def prepare_input() do
    File.stream!("input.txt")
    |> Enum.map(fn line ->
      line |> String.trim_trailing("\n")
    end)
  end

  def solution_1() do
    list = prepare_input()

    gamma =find_rate(list, @length, :gamma)
    epsilon =find_rate(list, @length, :epsilon)

    gamma * epsilon
  end

  defp find_rate(list, n, :gamma) do
    result = for n <- 0..n, do: most_freq(list, n)

    parse_result(result)
  end

  defp find_rate(list, n, :epsilon) do
    result = for n <- 0..n, do: least_freq(list, n)

    parse_result(result)
  end

  defp parse_result(data) do
    {result, _} =
      data
      |> Enum.map(fn {val, _freq} -> val end)
      |> List.to_string
      |> Integer.parse(2)

      result
  end

  defp most_freq(list, n) do
    list
    |> Enum.map(fn x -> String.at(x, n) end)
    |> Enum.frequencies()
    |> Enum.max_by(fn {_val, freq} -> freq end)
  end

  def least_freq(list, n) do
    list
    |> Enum.map(fn x -> String.at(x, n) end)
    |> Enum.frequencies()
    |> Enum.min_by(fn {_val, freq} -> freq end)
  end
end
