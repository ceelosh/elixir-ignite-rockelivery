defmodule Rockelivery do
  alias Rockelivery.Users.Create, as: UserCreate
  @moduledoc """
  Rockelivery keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_user(params), to: UserCreate, as: :call
end
