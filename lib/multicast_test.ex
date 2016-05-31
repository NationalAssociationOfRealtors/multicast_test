defmodule MulticastTest do
    use Application
    require Logger

    def start(_type, _args) do
        MulticastTest.Supervisor.start_link()
    end
end
