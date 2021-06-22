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
  @key Ed25519.generate_key_pair()
  
  def index(conn,_params) do
    Logger.info(conn)
    accepts = get_req_header(conn,"accept") |> List.first()
    if String.contains?(accepts,"text/html")== true, do: text(conn,@valid_script), else:   text(conn, @bad_script)
  end

  def checksum(conn,_params) do
    text(conn,:crypto.hash(:sha,@valid_script) |> Base.encode16() )
  end

  def signed(conn,_params) do
    {private_key,public_key} = @key
    text(conn,Ed25519.signature(@valid_script,private_key,public_key)|> Base.encode16())
  end

  def public(conn,_params)do
    text(conn,@key |> elem(1) |> Base.encode16())
  end
  
  
  
  
end
