from elixir:1.12

RUN apt-get update
RUN apt-get install -y  nodejs npm
RUN mix local.hex --force
RUN mix local.rebar --force
RUN curl  --referer 'https://github.com/MaSven/pretty_installer' 'https://codeload.github.com/MaSven/pretty_installer/zip/refs/heads/master' --output 'pretty_installer.zip'
RUN unzip pretty_installer.zip
WORKDIR pretty_installer-master
RUN export MIX_ENV=prod
RUN mix deps.get
RUN mix setup
RUN mix compile
CMD ["mix","phx.server"]
