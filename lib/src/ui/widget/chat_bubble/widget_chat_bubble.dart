import 'package:flutter/material.dart';

import '../../../model/model_chat.dart';
import 'widget_chat_bubble_base.dart';

class ChatBubble extends StatefulWidget {
  bool isMessageFromMe;
  MessageItem messageItem;

  ChatBubble({
    @required this.isMessageFromMe,
    @required this.messageItem,
  });

  @override
  State<StatefulWidget> createState() {
    if (isMessageFromMe)
      return _ChatSenderBubble();
    else
      return _ChatReceiverBubble();
  }
}

class _ChatReceiverBubble extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return ChatWidgetBubbleBase(
      bubbleColor: Colors.grey[200],
      message: widget.messageItem,
      time: "09:50",
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }
}

class _ChatSenderBubble extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return ChatWidgetBubbleBase(
      bubbleColor: Colors.green[200],
      message: widget.messageItem,
      time: "09:50",
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}
