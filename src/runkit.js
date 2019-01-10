const net = require('net');
const repl = require('repl');

repl.start({
  prompt: 'Node.js via stdin> ',
  input: process.stdin,
  output: process.stdout,
});

net
  .createServer(socket => {
    repl
      .start({
        prompt: 'Node.js via TCP socket> ',
        input: socket,
        output: socket,
      })
      .on('exit', () => {
        socket.end();
      });
  })
  .listen(5000);
