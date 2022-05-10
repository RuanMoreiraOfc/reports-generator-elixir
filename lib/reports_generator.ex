defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.reduce(%{}, fn line, acc ->
      [id, _name, price] = parse_line(line)

      oldPrice = acc[id] || 0
      newPrice = oldPrice + price

      Map.put(acc, id, newPrice)
    end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end
end
