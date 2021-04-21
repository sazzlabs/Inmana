defmodule Inmana do
  # This is a exemple of the facade design pattern, its just better to just centralize
  # all the complex methods in one file with names that makes more sense, isn't?

  alias Inmana.Restaurants.Create, as: RestaurantCreate
  alias Inmana.Supplies.Create, as: SupplyCreate
  alias Inmana.Supplies.Get, as: SupplyGet

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call

  defdelegate get_supply(params), to: SupplyGet, as: :call
end
