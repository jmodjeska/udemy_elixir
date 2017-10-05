defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    # alias shortens %Discuss.Topic to %Topic
    # empty changeset contains %Discuss.Topic{} (struct) and
    # an empty map %{} (params)

    render conn, "new.html", changeset: changeset
  end

  # def create(conn, params) do
  #   %{"topic" => topic} = params
  # end
  #
  # More concise version ...

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, err_changeset} ->
        render conn, "new.html", changeset: err_changeset
    end
  end
end
