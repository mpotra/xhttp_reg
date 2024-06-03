defmodule XHTTPReq.MixProject do
  use Mix.Project

  @source_url "https://github.com/mpotra/xhttp_req"
  @version "0.1.0"

  def project do
    [
      app: :xhttp_req,
      version: @version,
      elixir: "~> 1.14",
      deps: deps(),
      consolidate_protocols: Mix.env() != :test,
      elixirc_paths: elixirc_paths(Mix.env()),

      # Hex
      description: "Implementation of :xhttp protocols for Req",
      package: package(),

      # Docs
      name: "XHTTPReq",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:xhttp, "~> 0.1"},
      {:req, ">= 0.4.0"},
      # Docs deps only
      {:ex_doc, ">= 0.0.0", only: :docs, runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Mihai Potra"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url},
      files: ~w(.formatter.exs mix.exs README.md lib)
    ]
  end

  defp docs do
    [
      main: "XHTTPReq",
      source_ref: "v#{@version}",
      extra_section: "GUIDES",
      source_url: @source_url
    ]
  end
end
