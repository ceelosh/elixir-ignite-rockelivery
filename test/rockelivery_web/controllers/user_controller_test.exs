defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 24,
        "address" => "Rua Romeus Lux, 23",
        "cep" => "11222333",
        "cpf" => "12345678900",
        "email" => "marcelo@email.com.br",
        "password" => "1234567",
        "name" => "Marcelo"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "age" => 24,
                 "email" => "marcelo@email.com.br",
                 "id" => _id,
                 "name" => "Marcelo"
               }
             } = response
    end
  end
end
