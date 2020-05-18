import 'package:flutter/material.dart';

import '../../../model/model_chat.dart';

class ChatBubbleQuoteWidget extends StatelessWidget {
  MessageItem chatQuoted;

  ChatBubbleQuoteWidget({@required this.chatQuoted});

  @override
  Widget build(BuildContext context) {
    if (chatQuoted.messageBody != null) {
    
      return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(chatQuoted.chatSender.userFullname),
              Text(
                "${chatQuoted.messageBody}",
                style: Theme.of(context).textTheme.caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    } else
      return Container();
  }
}
