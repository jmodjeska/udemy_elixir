defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do
    # Explanation: https://www.udemy.com/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/learn/v4/t/lecture/5941682?start=0
    #
    # - struct represents a (soon to be) record in the db
    # - params represent the properties we want to update the struct with
    # - cast produces a changeset: how we get from where we are (the struct)
    #   to where we need to be (updated struct based on the params)
    #
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
