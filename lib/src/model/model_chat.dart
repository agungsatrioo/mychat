// To parse this JSON data, do
//
//     final chatListItem = chatListItemFromJson(jsonString);

import 'dart:convert';

class ChatListItem {
    String chatId;
    String chatName;
    Map<String, ChatParticipant> chatParticipant;
    Map<String, MessageItem> messageItem;
    MessageItem lastMessage;

    ChatListItem({
        this.chatId,
        this.chatName,
        this.chatParticipant,
        this.messageItem,
        this.lastMessage,
    });

    factory ChatListItem.fromRawJson(String str) => ChatListItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChatListItem.fromJson(Map<String, dynamic> json) => ChatListItem(
        chatId: json["chat_id"],
        chatName: json["chat_name"],
        chatParticipant: Map.from(json["chat_participant"]).map((k, v) => MapEntry<String, ChatParticipant>(k, ChatParticipant.fromJson(v))),
        messageItem: Map.from(json["message_item"]).map((k, v) => MapEntry<String, MessageItem>(k, MessageItem.fromJson(v))),
        lastMessage: MessageItem.fromJson(json["last_message"]),
    );

    Map<String, dynamic> toJson() => {
        "chat_id": chatId,
        "chat_name": chatName,
        "chat_participant": Map.from(chatParticipant).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "message_item": Map.from(messageItem).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "last_message": lastMessage.toJson(),
    };
}

class ChatParticipant {
    String userId;
    String userName;
    String userFullname;
    DateTime lastLogin;

    ChatParticipant({
        this.userId,
        this.userName,
        this.userFullname,
        this.lastLogin,
    });

    factory ChatParticipant.fromRawJson(String str) => ChatParticipant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChatParticipant.fromJson(Map<String, dynamic> json) => ChatParticipant(
        userId: json["user_id"],
        userName: json["user_name"],
        userFullname: json["user_fullname"],
        lastLogin: DateTime.parse(json["last_login"]),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_fullname": userFullname,
        "last_login": lastLogin.toIso8601String(),
    };
}

class MessageItem {
    String chatId;
    ChatParticipant chatSender;
    String picture;
    String sound;
    String file;
    String messageBody;
    DateTime timestamp;
    bool removed;
    int urgency;
    bool read;
    MessageItem quote;

    MessageItem({
        this.chatId,
        this.chatSender,
        this.picture,
        this.sound,
        this.file,
        this.messageBody,
        this.timestamp,
        this.removed,
        this.urgency,
        this.read,
        this.quote,
    });

    factory MessageItem.fromRawJson(String str) => MessageItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MessageItem.fromJson(Map<String, dynamic> json) => MessageItem(
        chatId: json["chat_id"],
        chatSender: ChatParticipant.fromJson(json["chat_sender"]),
        picture: json["picture"] == null ? null : json["picture"],
        sound: json["sound"] == null ? null : json["sound"],
        file: json["file"] == null ? null : json["file"],
        messageBody: json["message_body"],
        timestamp: DateTime.parse(json["timestamp"]),
        removed: json["removed"],
        urgency: json["urgency"],
        read: json["read"],
        quote: json["quote"] == null ? null : MessageItem.fromJson(json["quote"]),
    );

    Map<String, dynamic> toJson() => {
        "chat_id": chatId,
        "chat_sender": chatSender.toJson(),
        "picture": picture == null ? null : picture,
        "sound": sound == null ? null : sound,
        "file": file == null ? null : file,
        "message_body": messageBody,
        "timestamp": timestamp.toIso8601String(),
        "removed": removed,
        "urgency": urgency,
        "read": read,
        "quote": quote == null ? null : quote.toJson(),
    };
}