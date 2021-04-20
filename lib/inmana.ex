defmodule Inmana do
  # This is a exemple of the facade design pattern, its just better to just centralize
  # all the complex methods in one file with names that makes more sense, isn't?

  alias Inmana.Restaurants.Create

  defdelegate create_restaurant(params), to: Create, as: :call
end
