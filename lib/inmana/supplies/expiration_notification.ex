defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Supplies.{
    GetByExpiration,
    ExpirationEmail
  }

  alias Inmana.Mailer

  def send do
    data = GetByExpiration.call()

    data
    |> Task.async_stream(fn {to_email, supplies} ->
      handle_send_emails(to_email, supplies)
    end)
    |> Stream.run()
  end

  defp handle_send_emails(to_email, supplies) do
    to_email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
