defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo
  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 24,
      address: "Rua Romeus Lux, 23",
      cep: "11222333",
      cpf: "12345678900",
      email: "marcelo@email.com.br",
      password: "1234567",
      name: "Marcelo"
    }
  end

  def user_factory do
    %User{
      age: 24,
      address: "Rua Romeus Lux, 23",
      cep: "11222333",
      cpf: "12345678900",
      email: "marcelo@email.com.br",
      password: "1234567",
      name: "Marcelo",
      id: "f69fafbc-d690-4bce-806e-17bf519edd60"
    }
  end
end
