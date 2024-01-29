defimpl XHTTP.ResponseDocument, for: Req.Response do
  @moduledoc """
  Implementation of the [XHTTP.ResponseDocument](https://hexdocs.pm/xhttp/ResponseDocument.html)
  protocol for [req](https://hex.pm/packages/req)
  """
  alias XHTTP.Response

  @spec age(response :: @for.t()) :: non_neg_integer()
  def age(response) do
    response
    |> Response.header("age")
    |> Integer.parse()
    |> case do
      {age, _} -> age
      :error -> 0
    end
  end

  @spec content_type(response :: @for.t()) :: String.t() | nil
  def content_type(response) do
    Response.header(response, "content-type")
  end

  @spec date(response :: @for.t()) :: DateTime.t() | nil
  def date(response) do
    case date_from_header(response, "date") do
      {:ok, date} -> date
      _ -> nil
    end
  end

  @spec expires(response :: @for.t()) :: DateTime.t() | nil
  def expires(response) do
    case date_from_header(response, "expires") do
      {:ok, date} -> date
      _ -> nil
    end
  end

  @spec content_length(response :: @for.t()) :: non_neg_integer() | nil
  def content_length(response) do
    Response.header(response, "content-length")
  end

  @spec content(response :: @for.t()) :: XHTTP.Response.body()
  def content(response) do
    Response.body(response)
  end

  @spec last_modified(response :: @for.t()) :: DateTime.t() | nil
  def last_modified(response) do
    case date_from_header(response, "last-modified") do
      {:ok, date} -> date
      _ -> nil
    end
  end

  def date_from_header(response, header_name) do
    response
    |> Response.header(header_name)
    |> XHTTP.parse_http_date()
    |> case do
      {:ok, date} -> {:ok, date}
      _ -> {:error, :invalid_date}
    end
  end
end
