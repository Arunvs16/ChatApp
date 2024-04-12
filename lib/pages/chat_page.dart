import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverId;

  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverId,
  });

  //text controller

  final TextEditingController messageControler = TextEditingController();

  // chat and auth services

  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  //send messages

  void sendMessage() async {
    //if there is something inside the textfield
    if (messageControler.text.isNotEmpty) {
      //send the message
      await chatService.sendMessage(receiverId, messageControler.text);

      // clear text controller

      messageControler.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          //display all the messages

          Expanded(
            child: buildMessageList(),
          ),

          // user input

          buildUserInput(),
        ],
      ),
    );
  }

  // build message list
  Widget buildMessageList() {
    String senderId = authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessages(receiverId, senderId),
      builder: (context, snapshot) {
        // errors
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
print(snapshot.data!.docs);
        //return list view
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  //build message item
  Widget buildMessageItem(DocumentSnapshot doc){
    Map<String ,dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data[doc.toString()]);
  }

  //build message input
  Widget buildUserInput() {
    return Row(
      children: [
        // textfield should take up most of the space
        Expanded(
          child: MyTextField(
            controller: messageControler,
            hintext: "Type a message",
            obscuretext: false,
          ),
        ),

        //send button
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(Icons.arrow_upward),
        ),
      ],
    );
  }
}
