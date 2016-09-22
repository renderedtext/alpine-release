defmodule Mix.Tasks.Alpine.Release do

  def run(_) do
    app_name = Mix.Project.config |> Keyword.get(:app) |> Atom.to_string
    version  = Mix.Project.config |> Keyword.get(:version)

    IO.puts "Generating EXRM based Alpine release for #{app_name}:#{version}"
    IO.puts ""

    execute "rm -rf rel"
    execute "(docker stop builder && docker rm builder) || true"
    execute "docker run --name builder -e MIX_ENV=prod -w /release -di renderedtext/elixir-thrift-dev"
    execute "docker cp . builder:/release"
    execute "docker exec -i builder sh -c 'apk add erlang-edoc'"
    execute "docker exec -i builder sh -c 'apk add erlang-snmp'"
    execute "docker exec -i builder sh -c 'mix deps.get'"
    execute "docker exec -i builder sh -c 'mix compile'"
    execute "docker exec -i builder sh -c 'mix release'"
    execute "mkdir rel"
    execute "docker cp builder:/release/rel/#{app_name}/releases/#{version}/#{app_name}.tar.gz rel/app.tar.gz"

    IO.puts ""
    IO.puts "Done. Your release can can be found in 'rel/app.tar.gz'"
  end

  def execute(command) do
    IO.puts "---> #{command}"

    {result, exit_status} = System.cmd("sh", ["-c", command])

    IO.puts result

    if exit_status != 0 do
      IO.puts ""
      IO.puts "\e[31mError while running command.\e\[0m"
      System.halt(1)
    end

    result
  end

end
