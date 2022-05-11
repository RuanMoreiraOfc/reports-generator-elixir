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

  def build_many(files) when not is_list(files) do
    {:error, "Please provide a list of pahts for the files!"}
  end

  def build_many(files) do
    result =
      files
      |> Task.async_stream(&build/1)
      |> Enum.reduce(init_report_acc(30), &sum_reports/2)

    {:ok, result}
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

  defp sum_values([id, food_name, price], %{"foods" => foods, "users_bill" => usersBill}) do
    summed_foods = Map.put(foods, food_name, foods[food_name] + 1)
    summed_users_bill = Map.put(usersBill, id, usersBill[id] + price)

    %{"foods" => summed_foods, "users_bill" => summed_users_bill}
  end

  defp sum_reports(
         {:ok, %{"foods" => foods, "users_bill" => usersBill}},
         %{"foods" => accFoods, "users_bill" => accUsersBill}
       ) do
    merge_maps =
      &Map.merge(&1, &2, fn _key, valueFromFirstMap, valueFromSecondMap ->
        valueFromFirstMap + valueFromSecondMap
      end)

    summed_foods = merge_maps.(foods, accFoods)
    summed_users_bill = merge_maps.(usersBill, accUsersBill)

    %{"foods" => summed_foods, "users_bill" => summed_users_bill}
  end
end
