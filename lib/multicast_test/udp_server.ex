defmodule MulticastTest.UDPServer do
    use GenServer
    require Logger

    @port Application.get_env(:multicast_test, :udp_port)
    @multicast Application.get_env(:multicast_test, :multicast_address)

    def start_link do
        GenServer.start_link(__MODULE__, :ok)
    end

    def init(:ok) do
        Logger.info @port
        IO.inspect @multicast
        udp_options = [
            :binary,
            active:          10,
            add_membership:  { @multicast, {0,0,0,0} },
            multicast_if:    {0,0,0,0},
            multicast_loop:  false,
            multicast_ttl:   4,
            reuseaddr:       true
        ]
        {:ok, udp} = :gen_udp.open(@port, udp_options)
    end

    def handle_info({:udp, socket, ip, port, data}, state) do
        IO.inspect data
        {:noreply, state}
    end
end
