http = require 'http'

port = process.env.PORT || 3000

server = http.createServer (req, res) ->
  setTimeout(
    ->
      res.end "#{port} #{req.url}"
      return
    5000
  )
  return

server.listen port, -> console.log "#{port}"
