# PrettyInstaller

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


## Pretty Installer
This is a simulator for how not to distribute software. This is also a little homage to [Reflection on Trusting Trust](http://users.ece.cmu.edu/~ganger/712.fall02/papers/p761-thompson.pdf).

## Application
After the server is started, the instructions on how to use this are printed on the index page. So visit (http://localhost:4000). 

## Dependencies 
To run this locally you need.
- elixir > 1.12
- erlang/otp > 24

And thats it. For people who dont whant to install it locally there is a [Dockerfile](./scripts/Dockerfile).
You can run it with docker.
```bash
docker build -t pretty_installer scripts/
docker run --rm --name pretty_installer pretty_installer
```
