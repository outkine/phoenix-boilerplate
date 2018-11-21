defmodule ChicodeWeb.Router do
  use ChicodeWeb, :router
  import ChicodeWeb.Auth, only: [process_token: 2]

  pipeline :api do
    plug :accepts, ["json"]
    plug :process_token
  end

  scope "/api", ChicodeWeb do
    pipe_through :api

    scope "/v1" do
      get "/users", UserController, :index
      get "/users/:id", UserController, :show
      post "/users", UserController, :create
      put "/users", UserController, :update
      delete "/users", UserController, :delete

      post "/sessions", SessionController, :create
    end
  end
end
