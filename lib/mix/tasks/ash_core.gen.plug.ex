defmodule Mix.Tasks.AshCore.Gen.Plug do

  use Igniter.Mix.Task

  @impl Igniter.Mix.Task
  def igniter(igniter) do
    IO.inspect(igniter, label: "IGNITE1")
    # [module_name | _] = igniter.args.argv
    #
    # mod_name = Igniter.Code.Module.parse(module_name)
    # path = Igniter.Code.Module.proper_location(mod_name)
    # app_name = Igniter.Project.Application.app_name(igniter)
    #
    # igniter
    # |> Igniter.create_new_elixir_file(path, """
    # defmodule #{inspect(mod_name)} do
    #   use YourLib.Thing
    #
    #   ...some_code
    # end
    # """)

    # |> Igniter.Project.Config.configure(
    #   "config.exs",
    #   app_name,
    #   [:list_of_things],
    #   [module_name],
    #   &Igniter.Code.List.prepend_new_to_list(&1, module_name)
    # )
    #
    # defmodule AshCore.Session.Plug do
    #   import Plug.Conn
    #
    #   def init(_opts), do: nil
    #
    #   def call(conn, _opts) do
    #     ip_address = conn.remote_ip |> :inet.ntoa() |> to_string()
    #     assign(conn, :ip_address, ip_address)
    #   end
    # end
    #
    igniter
  end

end
