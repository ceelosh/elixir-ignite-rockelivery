defmodule Rockelivery.User do
  use Ecto.Schema

  import Ecto.Changeset

  @require_params [:age, :address, :cep, :cpf, :email, :password, :name]
  @require_update_params [:age, :address, :cep, :cpf, :email, :name]

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: [:id, :age, :email, :name]}
  schema "users" do
    field :age, :integer
    field :address, :string
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :password, :string, virtual: :true
    field :password_hash, :string
    field :name, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
      |> cast(params, @require_params)
      |> validate_required(@require_params)
      |> unique_constraint([:email])
      |> unique_constraint([:cpf])
      |> put_password_hash()
  end

  def changeset(struct, params) do
    struct
      |> cast(params, @require_update_params)
      |> validate_required(@require_update_params)
      |> unique_constraint([:email])
      |> unique_constraint([:cpf])
      |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end
end
