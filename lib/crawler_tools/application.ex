defmodule CrawlerTools.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CrawlerToolsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CrawlerTools.PubSub},
      # Start the Endpoint (http/https)
      CrawlerToolsWeb.Endpoint
      # Start a worker by calling: CrawlerTools.Worker.start_link(arg)
      # {CrawlerTools.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CrawlerTools.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CrawlerToolsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
