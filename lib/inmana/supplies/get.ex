defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  def call(uuid) do
    # If the supply does not exist, it'll return nil.
    case Repo.get(Supply, uuid) do
      nil -> {:error, %{result: "Supply not found.", status: :not_found}}
      supply -> {:ok, supply}
    end
  end
end
