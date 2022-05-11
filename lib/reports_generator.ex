defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  def build(file) do
    file
    |> Parser.parse_file()
    |> Enum.reduce(init_report_acc(30), &sum_values/2)
  end

  def retrieve_higher_value(report), do: Enum.max_by(report, fn {_key, value} -> value end)

  defp sum_values([id, _food_name, price], acc), do: Map.put(acc, id, acc[id] + price)

  defp init_report_acc(maxId), do: Enum.into(1..maxId, %{}, &{Integer.to_string(&1), 0})
end
