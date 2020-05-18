import 'package:flutter/material.dart';

import '../../../model/model_chat.dart';
import '../../shape/chat_bubble_shape.dart';
import 'widget_chat_bubble_quote.dart';

class ChatWidgetBubbleBase extends StatelessWidget {
  MainAxisAlignment mainAxisAlignment;
  Color bubbleColor;
  MessageItem message;
  String time;

  ChatWidgetBubbleBase({
    @required this.bubbleColor,
    @required this.message,
    @required this.time,
    @required this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    String timeStamp =
        TimeOfDay.fromDateTime(message.timestamp).format(context);

    double leftMargin =
        (mainAxisAlignment == MainAxisAlignment.start) ? 20 : 10;
    double rightMargin = (mainAxisAlignment == MainAxisAlignment.end) ? 20 : 10;

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        //ini avanya
        Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .7),
            padding: const EdgeInsets.all(4.0),
            child: CustomPaint(
                painter: ChatBubble(
                    color: bubbleColor, mainAxisAlignment: mainAxisAlignment),
                child: Container(
                    padding: EdgeInsets.only(
                        left: leftMargin,
                        right: rightMargin,
                        top: 10,
                        bottom: 10),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Visibility(
                                visible: message.quote != null,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ChatBubbleQuoteWidget(
                                      chatQuoted: message.quote,
                                    ),
                                    Divider()
                                  ],
                                )),
                            Text(
                              "${message.messageBody}" + ('\u202F' * 15),
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .merge(TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                timeStamp,
                                style: Theme.of(context).textTheme.caption,
                                textAlign: TextAlign.right,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Icon(Icons.done_all, size: 13),
                              )
                            ],
                          ),
                        ),
                      ],
                    )))),
      ],
    );
  }
}
