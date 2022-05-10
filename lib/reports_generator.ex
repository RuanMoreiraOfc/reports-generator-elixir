defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  def build(filename) do
    "reports/#{filename}"
    |> Parser.parse_file()
    |> Enum.reduce(init_report_acc(30), &sum_prices/2)
  end

  defp sum_prices([id, _name, price], acc), do: Map.put(acc, id, acc[id] + price)

  defp init_report_acc(maxId), do: Enum.into(1..maxId, %{}, &{Integer.to_string(&1), 0})
end
