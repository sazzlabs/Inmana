defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "no-reply@inmana.com.br",
      subject: subject_text(supplies),
      text_body: email_text(supplies)
    )
  end

  # Use the Restaurant name in the Subject
  defp subject_text(supplies) do
    initial_text = ": Supplies that are about to expire."

    subject =
      List.first(supplies).restaurant
      |> restaurant_string(initial_text)

    subject
  end

  defp restaurant_string(restaurant, initial_text) do
    restaurant.name <> initial_text
  end

  defp email_text(supplies) do
    initial_text = "------------- Supplies that are about to Expire -------------"

    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "\nDescription: #{description}\nExpiration Date: #{expiration_date}\nResponsible: #{
      responsible
    }\n"
  end
end
