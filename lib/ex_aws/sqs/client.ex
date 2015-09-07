defmodule ExAws.SQS.Client do
  defstruct config: nil, service: :"sqs", version: "2012-11-05"

  @defaults [
    region: "us-east-1",
    port: 80,
    scheme: "https://",
    host: "sqs.us-east-1.amazonaws.com"
  ]

  def new(opts \\ []) do
    %__MODULE__{}
    |> ExAws.Config.build(opts)
  end

  def config_root do
    Application.get_all_env(:ex_aws)
    |> Keyword.put(:"sqs", @defaults)
  end

  def request(client, uri, action, data) do
    ExAws.Request.Query.request(client, uri, action, data)
  end
end
