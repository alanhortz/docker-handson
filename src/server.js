var http = require('http');

var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end("Hello World! Hello Tom");
}

var www = http.createServer(handleRequest);
www.listen(8080);

console.log('server listening on 8080');