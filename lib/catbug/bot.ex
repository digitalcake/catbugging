defmodule Catbug.Bot do
  use Slack
  require IEx

  # So we'll define a start_link function, and we'll defer to the
  # Slack.start_link function, passing it our API Token
  def start_link(initial_state) do
    start_link(System.get_env("SLACK_BOT_API_TOKEN"), initial_state)
  end

  def handle_connect(slack, state) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, state}
  end

  def handle_message(message = %{type: "message"}, slack, state) do
    message_to_send = "Received #{length(state)} messages so far!"
    send_message(message_to_send, message.channel, slack)

    {:ok, state ++ [message.text]}
  end

  def handle_message(_message, _slack, state) do
    {:ok, state}
  end



 #  def init(initial_state, slack) do
 #    # We'll output when we're connected
 #    IO.puts "Connected as #{slack.me.name}"
 #    {:ok, initial_state}
 #  end
 #
 #  def handle_message({:type, "hello", response}, slack, state) do
 #   # The first message we receive from the slack socket will be the hello
 #   # message.  We'll use this to output the available channels.
 #   IO.puts "1 Available channels: #{inspect Slack.State.channels(slack)}"
 #   {:ok, state}
 # end
 #
 #  def handle_message(%{type: "hello"}, slack, state) do
 #    # The first message we receive from the slack socket will be the hello
 #    # message.  We'll use this to output the available channels.
 #    IO.puts "2 Available channels: #{inspect Slack.State.channels(slack)}"
 #    {:ok, state}
 #  end
 #
 #  def handle_message(message = %{type: "message"}, slack, state) do
 #    IEx.pry
 #  end

  # def handle_message(_, slack, state) do
  #
  #   IO.puts "message"
  #   IO.puts "slack"
  #   IO.inspect slack
  #   IO.puts "state"
  #   IO.inspect state

    #IEx.pry
    # tacos = ~r/\btacos?\b/
    # poop = ~r/\bpoop\b/
    # drop = ~r/\bdrop it\b/
    # snacks = ~r/\bsnacks?\b/
    # rage = ~r/\brage\b/
    # ok = ~r/\bok\b/
    # ok2 = ~r/\bthumbsup\b/
    # food = ~r/\bfood\b/
    # boom = ~r/\bboom\b/
    # dknow = ~r/\bdon'?t know\b/
    # broke = ~r/\bbroken?\b/
    # issue = ~r/\bissues?\b/
    # believe = ~r/\bbelieve\b/
    # pineapple = ~r/\bpineapple\b/
    # beer = ~r/\bbeers?\b/
    # resolved = ~r/\bresolved?\b/
    # bad = ~r/\bbad\b/
    # clap = ~r/\bclap\b/
    # catbug = ~r/\bcatbug\b/
    #
    # if text =~ catbug do
    #   Slack.send_message("My name is Catbug! What's yours?! http://static.tumblr.com/8ddc18737d36c0425f9da80a3f6a815c/be2tqlj/eIlmlmmgi/tumblr_static_9zklg4r_1_.gif", response.channel, slack)
    # end
    #
    # if text =~ bad do
    #   Slack.send_message("Why would you do that? http://38.media.tumblr.com/a90a275fa910f26fa9532c5b9b9036bd/tumblr_inline_o0lzg5HZML1tj1p0i_500.gif", response.channel, slack)
    # end
    #
    # if text =~ tacos do
    #   Slack.send_message("You're my friends now. We're having soft tacos later! https://45.media.tumblr.com/62b167879a37b87de49e6bf7b7c23af7/tumblr_n2gb89SmGu1r922pyo1_1280.gif", response.channel, slack)
    # end
    #
    # if text =~ beer do
    #   Slack.send_message("Now, wheres my big-old beer. Ah! :beer: there you are, yeah! http://49.media.tumblr.com/7a9900abacb6fa1c4dae023cb7b05805/tumblr_mxen48an5i1r6y37vo1_500.gif", response.channel, slack)
    # end
    #
    # if text =~ snacks do
    #   Slack.send_message("Your mom said to say I could have just one peanut butter square but not til after they cool down.", response.channel, slack)
    # end
    #
    # if text =~ food do
    #   Slack.send_message("He says he want's more carrots and bread crumbs!", response.channel, slack)
    # end
    #
    # if text =~ dknow do
    #   Slack.send_message("Yeah, but I don't know how to make myself go there. Maybe it might never happen again!", response.channel, slack)
    # end
    #
    # if text =~ believe do
    #   Slack.send_message("You just need to believe, clap your hands if you believe! :clap: :clap: :clap: http://i.imgur.com/h3CV3OH.gif", response.channel, slack)
    # end
    #
    # if text =~ clap do
    #   Slack.send_message("You just need to believe, clap your hands if you believe! :clap: :clap: :clap: http://i.imgur.com/h3CV3OH.gif ", response.channel, slack)
    # end
    #
    # if text =~ rage do
    #   Slack.send_message("Aaaaah! Impossibear has a gas powered stick! http://41.media.tumblr.com/37a8a5cca04abef751194b93fa177fac/tumblr_mqdk2dKys61s51i96o1_1280.jpg", response.channel, slack)
    # end
    #
    # if text =~ boom do
    #   Slack.send_message("Doooooon't hit me! https://45.media.tumblr.com/99794f9e291966ee7be2ee1fd46b4710/tumblr_mxir7vnfwr1qa50zao1_500.gif", response.channel, slack)
    # end
    #
    # if text =~ pineapple do
    #   Slack.send_message("Whooo, there's a large pineapple on a jacuzzi!!! https://49.media.tumblr.com/38a415b04d1711eac3fcffc382359068/tumblr_muvwdcjuC11sjuc4ko1_500.gif", response.channel, slack)
    # end
    #
    # if text =~ drop do
    #   drop_it_msg = ["https://media.giphy.com/media/dMaL2ZtDP2zmw/giphy.gif", "OK!!!!"]
    #   Slack.send_message(Enum.random(drop_it_msg), response.channel, slack)
    # end
    #
    # if text =~ poop do
    #   Slack.send_message("Are you going to go doodie! WHOAAAA!", response.channel, slack)
    # end
    #
    # if text =~ ok do
    #   Slack.send_message("Yeah! Everything is okay! https://49.media.tumblr.com/5c04c7949ca60552cdd2258dbee9cce6/tumblr_mrdyacE8cW1rbj0weo1_500.gif", response.channel, slack)
    # end
    #
    # if text =~ ok2 do
    #   Slack.send_message("Yeah! Everything is okay! https://49.media.tumblr.com/5c04c7949ca60552cdd2258dbee9cce6/tumblr_mrdyacE8cW1rbj0weo1_500.gif", response.channel, slack)
    # end
    #
    # if text =~ issue do
    #   msg = ["Throw a blanket over it!", "Yeah! Everything is okay!", "Put a little fence around it!", "Pony Lords! Jump for your lives!", ]
    #   Slack.send_message(Enum.random(msg), response.channel, slack)
    # end
    #
    # if text =~ broke do
    #   msg = ["Throw a blanket over it!", "Yeah! Everything is okay!", "Put a little fence around it!", "Pony Lords! Jump for your lives!", ]
    #   Slack.send_message(Enum.random(msg), response.channel, slack)
    # end
    #
    # if text =~ resolved do
    #   msg = ["Throw a blanket over it!", "Yeah! Everything is okay!", "Put a little fence around it!"]
    #   Slack.send_message(Enum.random(msg), response.channel, slack)
    # end

  #   {:ok, state}
  # end



  # def handle_message({:type, type, _response}, _slack, state) do
  #   #IO.puts "some other type"
  #   {:ok, state}
  # end
  #
  # defp match_string
end
