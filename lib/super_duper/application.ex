defmodule SuperDuper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias SuperDuper.Server

  def start(_type, _args) do
    IO.puts(">>>> Starting Super-Duper Supervisor <<<<<")

    children = [
      {Server, :superdave},
      {Server, :superman},
      {Server, :supermario}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: SuperDuper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
