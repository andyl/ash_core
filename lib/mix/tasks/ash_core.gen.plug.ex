defmodule Mix.Tasks.AshCore.Gen.Plug.Docs do

  @moduledoc false

  @spec short_doc() :: String.t()
  def short_doc do
    "Install AshCore Plug"
  end

  @spec example() :: String.t()
  def example do
    "mix ash_core.gen.plug"
  end

  @spec long_doc() :: String.t()
  def long_doc do
    """
    #{short_doc()}

    Install `ash_core` into your Phoenix app.

    Requires ash

    ## Example

    ```sh
    #{example()}
    ```

    ## Options

    * `--example-option` or `-e` - Docs for your option
    """
  end
end

if Code.ensure_loaded?(Igniter) do
  defmodule Mix.Tasks.AshCore.Gen.Plug do
    @shortdoc "#{__MODULE__.Docs.short_doc()}"

    @moduledoc __MODULE__.Docs.long_doc()

    use Igniter.Mix.Task
    require Igniter.Code.Common

    defp plug_module do
      """
      defmodule AshCore.Session.Plug do
        import Plug.Conn

        def init(_opts), do: nil

        def call(conn, _opts) do
          ip_address = conn.remote_ip |> :inet.ntoa() |> to_string()
          assign(conn, :ip_address, ip_address)
        end
      end
      """
    end

    @impl Igniter.Mix.Task
    def igniter(igniter) do

      plug_path = Igniter.Project.Module.proper_location(igniter, AshCore.Session.Plug)

      igniter
      |> Igniter.create_new_file(plug_path, plug_module())
      |> Igniter.Libs.Phoenix.append_to_pipeline(:browser, "plug AshCore.Session.Plug")
    end
  end
else
  defmodule Mix.Tasks.AshCore.Gen.Plug do
    @shortdoc "#{__MODULE__.Docs.short_doc()} | Install `igniter` to use"

    @moduledoc __MODULE__.Docs.long_doc()

    use Mix.Task

    @impl Mix.Task
    def run(_argv) do
      Mix.shell().error("""
      The task 'ash_core.gen.plug' requires igniter. Please install igniter and try again.

      For more information, see: https://hexdocs.pm/igniter/readme.html#installation
      """)

      exit({:shutdown, 1})
    end
  end
end
