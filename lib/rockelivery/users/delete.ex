defmodule Rockelivery.Users.Delete do
  alias Ecto.UUID
  alias Rockelivery.{Repo, User, Error}

  def call(id) do
    case UUID.cast(id) do
      :error -> Error.build_id_format_error()
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(User, id) do
      nil -> Error.build_user_not_found()
      user -> Repo.delete!(user)
    end
  end
end
