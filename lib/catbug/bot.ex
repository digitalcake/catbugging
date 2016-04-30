defmodule Catbug.Bot do
  use Slack
  import Catbug.Bot.Speak

  def start_link(initial_state) do
    start_link(System.get_env("SLACK_BOT_API_TOKEN"), initial_state)
  end

  def handle_connect(slack, state) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, state}
  end

  # Don't handle your own messages silly
  def handle_message(%{type: "message", user: user}, slack = %{me: %{id: user}}, state) do
    IO.puts "wow that was me?!"
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: _, channel: _}, slack, state) do
    send_reply(Catbug.Bot.Speak.witty_reply(message.text), message.channel, slack)
    {:ok, state}
  end

  def handle_message(_message, _slack, state) do
    {:ok, state}
  end

  defp send_reply(nil, _channel, _slack) do
    {:ok}
  end

  defp send_reply(reply, channel, slack) do
    send_message(reply, channel, slack)
  end

end
