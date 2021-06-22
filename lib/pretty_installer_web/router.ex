defmodule PrettyInstallerWeb.Router do
  use PrettyInstallerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

 
  

  pipeline :api do
    plug :accepts, ["text"]
  end

  scope "/",PrettyInstallerWeb do
    pipe_through :api
    get "/static", PayloadController,:index
    get "/checksum", PayloadController,:checksum
    get "/sign", PayloadController,:signed
    get "/public", PayloadController,:public
  end
  

  scope "/", PrettyInstallerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PrettyInstallerWeb do
  #   pipe_through :api
  # end
end
