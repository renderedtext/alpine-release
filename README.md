# Alpine Release

Generate an exrm release for Alpine Docker with ease.

## Installation

Add alpine_release to your list of dependencies in `mix.exs`:

``` elixir
def deps do
  [
    {:exrm, "~> 1.0"},
    {:alpine_release, github: "renderedtext/alpine-release"}
  ]
end
```

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
