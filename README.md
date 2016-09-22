# Alpine Release

Generate an exrm release for Alpine Docker with ease.

## Installation

Add alpine_release to your list of dependencies in `mix.exs`:

``` elixir
def deps do
  [{:alpine_release, "~> 0.0.1"}]
end
```

## Generate an release

``` bash
mix alpine.release
```

When it finishes, your release can be found in `rel/app.tar.gz` and ready to be
injected in any Alpine Based docker image.
