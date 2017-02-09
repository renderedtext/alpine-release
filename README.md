# Alpine Release

Generate a distillery release for Alpine Docker with ease.

## Installation

Add alpine_release to your list of dependencies in `mix.exs`:

``` elixir
def deps do
  [
    {:distillery, "~> 1.0"},
    {:alpine_release, github: "renderedtext/alpine-release"}
  ]
end
```

## Working with distillery

Run:

```bash
mix release.init
```
to generate `rel/config.exs` configuration file. This file is used by distillery
to build you release, so make sure you have it checked in your version control
system if you plan to build your releases remotely.

More info about the configuration can be found on [Distillery
docs](https://hexdocs.pm/distillery/configuration.html).

### Notable differences from exrm

Distillery has some differences compared to
[exrm](https://github.com/bitwalker/exrm) in respect to replacing OS variables
in your Dockerfiles.

This will work:
```bash
`REPLACE_OS_VARS=true`
```
but this won't:
```bash
`RELX_REPLACE_OS_VARS=true`
```

For more info, check out [distillery github repo](https://github.com/bitwalker/distillery).

## Generate a release

``` bash
mix alpine.release
```

When it finishes, your release can be found in `rel/app.tar.gz` and ready to be
injected in any Alpine Based docker image.

You can also specify the environment in which you what the release to be made, for example:

```bash
MIX_ENV=test mix alpine.release
```
