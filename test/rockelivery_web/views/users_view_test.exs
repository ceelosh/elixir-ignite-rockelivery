defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: "Rua Romeus Lux, 23",
               age: 24,
               cep: "11222333",
               cpf: "12345678900",
               email: "marcelo@email.com.br",
               id: "f69fafbc-d690-4bce-806e-17bf519edd60",
               inserted_at: nil,
               name: "Marcelo",
               password: "1234567",
               password_hash: nil,
               updated_at: nil
             }
           } == response
  end
end
