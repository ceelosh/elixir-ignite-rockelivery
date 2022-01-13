defmodule Rockelivery.Users.CreateTest do

  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.Users.Create
  alias Rockelivery.{Error, User}

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 24, email: "marcelo@email.com.br"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{age: 14})

      response = Create.call(params)
      {:error, %Error{result: changeset}} = response

      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
