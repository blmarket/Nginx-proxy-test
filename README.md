Nginx-proxy-test
----------------

Can we use nginx as zero-downtime provider? YES.

## Test purpose

check what nginx do when one of upstream server has been dead by some reason.

## test set

use nginx-siteconf as nginx configuration

launch server with some ports,

```
PORT=3000 coffee fastserver.coffee
PORT=3001 coffee fastserver.coffee
PORT=3002 coffee fastserver.coffee
PORT=3003 coffee fastserver.coffee
```

run client

```
coffee pingclient.coffee
```

Check response, and make some failure on some of upstream servers. and see client gets 5xx errors.

## Result

with `proxy_next_upstream` directive, nginx does not send 5xx error for client. when there is working server.

## What this mean with zero-timeout deployments?

Think your existing application uses 3000, 3001 then you can launch new application using 3002, 3003,
making nginx accepts them as healthy servers, then kill old application.
