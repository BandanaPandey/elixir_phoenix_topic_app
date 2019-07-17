defmodule DiscussWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  # channel "room:*", DiscussWeb.RoomChannel

  channel "comments:*", DiscussWeb.CommentsChannel
  # get "/comments/:id", CommentController, :join, :handle_in

  def connect(%{"token" => token}, socket, _connect_info) do
    case Phoenix.Token.verify(socket, "key", token) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}
      {:error, _error} ->
        :error
    end
  end

  def id(_socket), do: nil
end
