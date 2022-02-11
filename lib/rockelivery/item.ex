defmodule Rockelivery.Item do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @require_params [:category, :description, :price, :photo]

  @derive {Jason.Encoder, only: @require_params ++ [:id]}

  @category_options [:food, :drink, :desert]

  schema "items" do
    field :category, Ecto.Enum, values: @category_options
    field :description, :string
    field :price, :decimal
    field :photo, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @require_params)
    |> validate_required(@require_params)
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end
end
