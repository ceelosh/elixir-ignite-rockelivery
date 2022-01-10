defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)
      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Marcelo"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        age: 24,
        address: "Rua Romeus Lux, 23",
        cep: "11222333",
        cpf: "12345678900",
        email: "marcelo@email.com.br",
        password: "1234567",
        name: "Marcelo"
      }


      update_params = %{name: "Marcelo Luz", password: "1234567" }

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Marcelo Luz"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        age: 17,
        address: "Rua Romeus Lux, 23",
        cep: "11222333",
        cpf: "12345678900",
        email: "marcelo@email.com.br",
        password: "1234567",
        name: "Marcelo"
      }


      response = User.changeset(params)

      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert errors_on(response) == expected_response
    end
  end
end
