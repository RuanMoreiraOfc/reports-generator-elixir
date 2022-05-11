defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  @available_foods [
    "açaí",
    "churrasco",
    "esfirra",
    "hambúrguer",
    "pastel",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  @retrieve_higher_value_available_options [
    "foods",
    "users_bill"
  ]

  def build(file) do
    file
    |> Parser.parse_file()
    |> Enum.reduce(init_report_acc(30), &sum_values/2)
  end

  def retrieve_higher_value(report, option)
      when option in @retrieve_higher_value_available_options do
    {:ok, Enum.max_by(report[option], fn {_key, value} -> value end)}
  end

  def retrieve_higher_value(_report, _option) do
    {
      :error,
      "Invalid option, only accepeted `#{Enum.join(@retrieve_higher_value_available_options, ", ")}`!"
    }
  end

  defp init_report_acc(maxId) do
    foods = Enum.into(@available_foods, %{}, &{&1, 0})
    users_bill = Enum.into(1..maxId, %{}, &{Integer.to_string(&1), 0})

    %{"foods" => foods, "users_bill" => users_bill}
  end

  defp sum_values([id, food_name, price], %{"foods" => foods, "users_bill" => users_bill}) do
    summed_foods = Map.put(foods, food_name, foods[food_name] + 1)
    summed_users_bill = Map.put(users_bill, id, users_bill[id] + price)

    %{"foods" => summed_foods, "users_bill" => summed_users_bill}
  end
end
