defmodule Mix.Tasks.AshCore.Install.Docs do
  @moduledoc false

  @spec short_doc() :: String.t()
  def short_doc do
    "Install AshCore"
  end

  @spec example() :: String.t()
  def example do
    "mix ash_core.install"
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
  defmodule Mix.Tasks.AshCore.Install do
    @shortdoc "#{__MODULE__.Docs.short_doc()}"

    @moduledoc __MODULE__.Docs.long_doc()

    use Igniter.Mix.Task

    @impl Igniter.Mix.Task
    def info(_argv, _composing_task) do
      %Igniter.Mix.Task.Info{
        # Groups allow for overlapping arguments for tasks by the same author
        # See the generators guide for more.
        group: :ash_core,
        # *other* dependencies to add
        # i.e `{:foo, "~> 2.0"}`
        adds_deps: [],
        # *other* dependencies to add and call their associated installers, if they exist
        # i.e `{:foo, "~> 2.0"}`
        installs: [],
        # An example invocation
        example: __MODULE__.Docs.example(),
        # A list of environments that this should be installed in.
        only: nil,
        # a list of positional arguments, i.e `[:file]`
        positional: [],
        # Other tasks your task composes using `Igniter.compose_task`, passing in the CLI argv
        # This ensures your option schema includes options from nested tasks
        composes: ["ash_core.gen.plug"],
        # `OptionParser` schema
        schema: [],
        # Default values for the options in the `schema`
        defaults: [],
        # CLI aliases
        aliases: [],
        # A list of options in the schema that are required
        required: []
      }
    end

    @impl Igniter.Mix.Task
    def igniter(igniter) do
      igniter
      |> Igniter.compose_task("ash_core.gen.plug")
    end
  end
else
  defmodule Mix.Tasks.AshCore.Install do
    @shortdoc "#{__MODULE__.Docs.short_doc()} | Install `igniter` to use"

    @moduledoc __MODULE__.Docs.long_doc()

    use Mix.Task

    @impl Mix.Task
    def run(_argv) do
      Mix.shell().error("""
      The task 'ash_core.install' requires igniter. Please install igniter and try again.

      For more information, see: https://hexdocs.pm/igniter/readme.html#installation
      """)

      exit({:shutdown, 1})
    end
  end
end
