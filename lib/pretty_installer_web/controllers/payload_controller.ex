defmodule PrettyInstallerWeb.PayloadController do
  use PrettyInstallerWeb, :controller
  require Logger

  @valid_script """
  #!/usr/bin/env bash
  
  echo "Everything is fine"
  """
  @bad_script """
  #!/usr/bin/env bash
  echo "Pwned you"
  """
  @key :public_key.generate_key(ecParams: {:namedCurve,:prime256v1})
  
  def index(conn,_params) do
    Logger.info(conn)
    accepts = get_req_header(conn,"accept") |> List.first()
    if String.contains?(accepts,"text/html")== true, do: text(conn,@valid_script), else:   text(conn, @bad_script)
  end

  def checksum(conn,_params) do
    text(conn,:crypto.hash(:sha,@valid_script) |> Base.encode16() )
  end

  def signed(conn,_params) do
    {_public_key,private_key} = @key
    text(conn,:public_key.sign(:sha256 ,@valid_script,private_key ))
  end

  def public(conn,_params)do
    text(conn,@key |> elem(1))
  end
  
  
  
  
end
