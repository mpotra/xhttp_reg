defimpl XHTTP.Response, for: Req.Response do
  @moduledoc """
  Implementation of the [XHTTP.Response](https://hexdocs.pm/xhttp/Response.html) protocol
  for [req](https://hex.pm/packages/req)
  """

  @doc """
  Retrieve the body in the Response.
  """
  @spec body(response :: @for.t()) :: XHTTP.Response.body()
  def body(%{body: body}), do: body

  @doc """
  Retrieve the status code of the HTTP response.
  """
  @spec status(response :: @for.t()) :: XHTTP.Response.status()
  def status(%{status: status}), do: status

  @doc """
  Retrieve the last value for a given header.
  """
  @spec header(response :: @for.t(), default :: term()) :: XHTTP.Response.header_value()
  def header(res, header, default \\ nil) do
    res
    |> Req.Response.get_header(header)
    |> List.last(default)
  end

  @doc """
  Return an enumerable of headers as `{key, value}` pairs.
  """
  @spec headers(response :: @for.t()) :: Enumerable.t(XHTTP.Response.header())
  def headers(%{headers: headers}), do: headers

  @doc """
  Checks whether the HTTP response contains the searched header name.
  """
  @spec header_member?(response :: @for.t(), header :: String.t()) :: boolean()
  def header_member?(%{headers: headers}, header),
    do: Map.has_key?(headers, String.downcase(header, :ascii))
end
