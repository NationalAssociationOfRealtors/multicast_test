# MulticastTest

start application with iex -S mix

use netcat or similar client to send multicast messages to 239.255.41.11:5683

like so echo "hello" | nc -u 239.255.41.11 5683

you should see the elixir app echo out "hello\n"
