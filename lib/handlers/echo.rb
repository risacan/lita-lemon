class Echo < Handler
  route(/^echo\s+(.+)/, :echo, help: {"echo TEXT" => "Echoes back TEXT."})

  def echo(response)
    response.reply(response.matches)
  end
end
