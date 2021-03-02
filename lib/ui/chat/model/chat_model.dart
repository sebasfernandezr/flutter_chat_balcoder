
class ChatModel{
  String key;
  String message;
  String uid;
  String sendTouid;

  ChatModel({
    this.key,
    this.message,
    this.uid,
    this.sendTouid
  });

  toJson() {
    return {
      "key": key,
      "messaje": message,
      "uId":uid,
      "sendTouid":sendTouid
    };
  }

}