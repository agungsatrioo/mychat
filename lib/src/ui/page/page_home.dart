import 'package:flutter/material.dart';

import '../../model/model_chat.dart';
import '../../model/model_chat_dummy_dataset.dart';
import '../widget/chat_bubble/widget_chat_bubble.dart';

class ChatroomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatroomPageState();
}

class _ChatroomPageState extends State<ChatroomPage> {
  List<MessageItem> _messageItem;
  List<ChatParticipant> _chatParticipant; 
  ChatParticipant _currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _messageItem = getChats();
    _chatParticipant = getParticipants();
    _currentUser = _chatParticipant[0];

    
    return Scaffold(
      appBar: AppBar(
        title: Text("MyChat"),
      ),
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.only(bottom: 75, left:2.5, right:2.5, top:10),
            itemCount: _messageItem.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, item) {
              return ChatBubble(
                isMessageFromMe: _messageItem[item].chatSender.userId == _currentUser.userId,
                messageItem: _messageItem[item],
              );
            }
          ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left:40),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[100]
                ),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.face), onPressed: () {}),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Type Something...",
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.photo_camera),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.attach_file),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 15),
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.lightGreen, shape: BoxShape.circle),
              child: InkWell(
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                onLongPress: () {
                  
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}