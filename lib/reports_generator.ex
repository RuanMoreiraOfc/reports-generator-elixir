defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.reduce(init_report_acc(30), fn line, acc ->
      [id, _name, price] = parse_line(line)

      old_price = acc[id]
      new_price = old_price + price

      Map.put(acc, id, new_price)
    end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end

  defp init_report_acc(maxId), do: Enum.into(1..maxId, %{}, &{Integer.to_string(&1), 0})
end
