defmodule ReportsGeneratorTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      file = "reports/report_test.csv"

      expected_response = %{
        "foods" => %{
          "açaí" => 1,
          "churrasco" => 2,
          "esfirra" => 3,
          "hambúrguer" => 2,
          "pastel" => 0,
          "pizza" => 2,
          "prato_feito" => 0,
          "sushi" => 0
        },
        "users_bill" => %{
          "1" => 48,
          "10" => 36,
          "11" => 0,
          "12" => 0,
          "13" => 0,
          "14" => 0,
          "15" => 0,
          "16" => 0,
          "17" => 0,
          "18" => 0,
          "19" => 0,
          "2" => 45,
          "20" => 0,
          "21" => 0,
          "22" => 0,
          "23" => 0,
          "24" => 0,
          "25" => 0,
          "26" => 0,
          "27" => 0,
          "28" => 0,
          "29" => 0,
          "3" => 31,
          "30" => 0,
          "4" => 42,
          "5" => 49,
          "6" => 18,
          "7" => 27,
          "8" => 25,
          "9" => 24
        }
      }

      response =
        file
        |> ReportsGenerator.build()

      assert response === expected_response
    end
  end

  describe "build_many/2" do
    test "returns error when `files` is not a list" do
      files = {:any, :any}

      expected_response = {:error, "Please provide a list of pahts for the files!"}

      response =
        files
        |> ReportsGenerator.build_many()

      assert response === expected_response
    end
  end

  describe "retrieve_higher_value/2" do
    test "returns error when `option` is invalid" do
      file = "reports/report_test.csv"
      option = "any_invalid_key"

      expected_response = {:error, "Invalid option, only accepeted `foods, users_bill`!"}

      response =
        file
        |> ReportsGenerator.build()
        |> ReportsGenerator.retrieve_higher_value(option)

      assert response === expected_response
    end

    test "returns the users who spent most when `option` is 'users_bill'" do
      file = "reports/report_test.csv"
      option = "users_bill"

      expected_response = {:ok, {"5", 49}}

      response =
        file
        |> ReportsGenerator.build()
        |> ReportsGenerator.retrieve_higher_value(option)

      assert response === expected_response
    end

    test "returns the most consumed food when `option` is 'foods'" do
      file = "reports/report_test.csv"
      option = "foods"

      expected_response = {:ok, {"esfirra", 3}}

      response =
        file
        |> ReportsGenerator.build()
        |> ReportsGenerator.retrieve_higher_value(option)

      assert response === expected_response
    end
  end
end
