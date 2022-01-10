defmodule Rockelivery.Factory do
  use ExMachina

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
end
