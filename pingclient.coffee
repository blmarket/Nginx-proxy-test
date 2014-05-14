http = require 'http'
request = require 'request'

http.globalAgent.maxSockets = 2000

index = 0

ping = ->
  index = index + 1
  do (index) ->
    request.get "http://localhost:4000/#{index}", (err, resp, body) ->
      console.log new Date(), resp.statusCode, index, body
      return
    return
  return

setInterval ping, 50
