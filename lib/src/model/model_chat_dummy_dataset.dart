import 'model_chat.dart';

List<ChatParticipant> getParticipants() => [
  ChatParticipant(
    userId: "1",
    userName: "jajang",
    userFullname: "Ritni Salma"
  ),
  ChatParticipant(
    userId: "2",
    userName: "ceyang",
    userFullname: "Dadang"
  )
];

List<MessageItem> getChats() {
  List<MessageItem> lists = [
  MessageItem(
    chatSender: getParticipants()[0],
    messageBody: "Hi there!",
    timestamp: DateTime.now()
  ),  
  MessageItem(
    chatSender: getParticipants()[1],
    messageBody: "Oh hi too",
    timestamp: DateTime.now().add(Duration(minutes: 10))
  ),
  MessageItem(
    chatSender: getParticipants()[0],
    messageBody: "What an awesome prototype chat app! The UI is simple and nice!",
    timestamp: DateTime.now().add(Duration(minutes: 15))
  ),  
  MessageItem(
    chatSender: getParticipants()[0],
    messageBody: "How do you make it?",
    timestamp: DateTime.now().add(Duration(minutes: 15))
  ),  
  MessageItem(
    chatSender: getParticipants()[1],
    messageBody: "This prototype is created using Flutter Framework.",
    timestamp: DateTime.now().add(Duration(minutes: 30))
  ),  
    MessageItem(
    chatSender: getParticipants()[1],
    messageBody: "It demonstrates several features that is familiar if you're using WhatsApp, such as quoting.",
    timestamp: DateTime.now().add(Duration(minutes: 32))
  ),  
  MessageItem(
    chatSender: getParticipants()[0],
    messageBody: "Oke",
    timestamp: DateTime.now().add(Duration(minutes: 35))
  )
];

lists[1].quote = lists[0];
lists[4].quote = lists[2];
lists[6].quote = lists[5];

return lists;
}