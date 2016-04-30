defmodule Catbug.Bot.Speak do
  def witty_reply(msg) do
    msg_to_atom(msg) |> expand_reply
  end

  defp msg_to_atom(msg) do
    Enum.find([
      {:tacos, ~r/\btacos?\b/},
      {:believe, ~r/\bclap\b/},
      {:broke, ~r/\bbroken?\b/},
      {:crash, ~r/\bcrash\b/},
      {:peanut, ~r/\bsnacks?\b/},
      {:stick, ~r/\brage\b/},
      {:more, ~r/\bfood\b/},
      {:boom, ~r/\bboom\b/},
      {:dknow, ~r/\bdon'?t know\b/},
      {:issue, ~r/\bissues?\b/},
      {:believe, ~r/\bbelieve\b/},
      {:pineapple, ~r/\bpineapple\b/},
      {:beer, ~r/\bbeers?\b/},
      {:why, ~r/\bbad\b/},
      {:hello, ~r/\bcatbug\b/}
    ], {nil}, fn({k,r}) -> msg =~ r end) |>
    Tuple.to_list |>
    List.first
  end

  defp expand_reply(key) when is_atom(key) do
    %{
      hello: "My name is Catbug! What's yours?! http://static.tumblr.com/8ddc18737d36c0425f9da80a3f6a815c/be2tqlj/eIlmlmmgi/tumblr_static_9zklg4r_1_.gif",
      why: "Why would you do that? http://38.media.tumblr.com/a90a275fa910f26fa9532c5b9b9036bd/tumblr_inline_o0lzg5HZML1tj1p0i_500.gif",
      tacos: "You're my friends now. We're having soft tacos later! https://45.media.tumblr.com/62b167879a37b87de49e6bf7b7c23af7/tumblr_n2gb89SmGu1r922pyo1_1280.gif",
      beer:  "Now, wheres my big-old beer. Ah! :beer: there you are, yeah! http://49.media.tumblr.com/7a9900abacb6fa1c4dae023cb7b05805/tumblr_mxen48an5i1r6y37vo1_500.gif",
      peanut: "Your mom said to say I could have just one peanut butter square but not til after they cool down.",
      more: "He says he want's more carrots and bread crumbs!",
      dont_know: "Yeah, but I don't know how to make myself go there. Maybe it might never happen again!",
      believe: "You just need to believe, clap your hands if you believe! :clap: :clap: :clap: http://i.imgur.com/h3CV3OH.gif",
      stick: "Aaaaah! Impossibear has a gas powered stick! http://41.media.tumblr.com/37a8a5cca04abef751194b93fa177fac/tumblr_mqdk2dKys61s51i96o1_1280.jpg",
      boom: "Doooooon't hit me! https://45.media.tumblr.com/99794f9e291966ee7be2ee1fd46b4710/tumblr_mxir7vnfwr1qa50zao1_500.gif",
      pineapple: "Whooo, there's a large pineapple on a jacuzzi!!! https://49.media.tumblr.com/38a415b04d1711eac3fcffc382359068/tumblr_muvwdcjuC11sjuc4ko1_500.gif",
      thumbsup: "Yeah! Everything is okay! https://49.media.tumblr.com/5c04c7949ca60552cdd2258dbee9cce6/tumblr_mrdyacE8cW1rbj0weo1_500.gif",
      crash: "Throw a blanket over it!",
      broke: "Put a little fence around it!"
    }[key]
  end
end
