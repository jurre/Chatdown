$(function () {
  var $messages = $('#messages');
  var $messageInput = $('#message-input');

  var socket = new Phoenix.Socket('/ws');
  socket.join('rooms', 'public', {}, function (channel) {
    channel.on('new:message', function (message) {
      console.log(message);
      $messages.append('<li>' + message.content + '<span class="time">' + message.time + '</span></li>');
    });

    channel.on('error', function(error) {
      console.log('Error :( Reason: ' + error.reason);
    });

    $messageInput.off('keypress').on('keypress', function (e) {
      if (e.keyCode === 13) {
        console.log('SEND: ' + $messageInput.val());
        channel.send('new:message', {
          content: $messageInput.val(),
          time: currentTime()
        });
        $messageInput.val('');
      }
    });
  });
});
