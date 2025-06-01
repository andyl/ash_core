defmodule AshCore.Session do
  use Ash.Domain,
    otp_app: :ash_core

  resources do
    resource AshCore.Session.Page
  end

  @doc """
  Valid args: name, count
  """
  def create_page(args \\ %{}) when is_map(args) do
    lcl_args = Map.merge(args, %{session_id: gen_id()})
    AshCore.Session.Page
    |> Ash.Changeset.for_create(:create, lcl_args)
    |> Ash.create!()
  end

  def list_pages do
    AshCore.Session.Page
    |> Ash.Query.for_read(:read)
    |> Ash.read!()
  end

  def update_page(page_id) do
    AshCore.Session.Page
    |> Ash.get!(page_id)
    |> Ash.Changeset.for_update(:update, %{name: "Updated Page", count: 100})
    |> Ash.update!()
  end

  defp gen_id() do
    chars = ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    Enum.take_random(chars, 4) |> Enum.join()
  end
end
