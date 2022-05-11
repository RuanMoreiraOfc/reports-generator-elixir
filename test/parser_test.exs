defmodule ReportsGenerator.ParserTest do
  alias ReportsGenerator.Parser
  use ExUnit.Case

  describe "parse_file/2" do
    test "parses the file" do
      file = "reports/report_test.csv"

      expected_response = [
        ["1", "pizza", 48],
        ["2", "açaí", 45],
        ["3", "hambúrguer", 31],
        ["4", "esfirra", 42],
        ["5", "hambúrguer", 49],
        ["6", "esfirra", 18],
        ["7", "pizza", 27],
        ["8", "esfirra", 25],
        ["9", "churrasco", 24],
        ["10", "churrasco", 36]
      ]

      response =
        file
        |> Parser.parse_file()
        |> Enum.map(& &1)

      assert response == expected_response
    end
  end
end
