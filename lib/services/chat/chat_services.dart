import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // get instance of firestore

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go through individual user
        final user = doc.data();

        // return user
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String receiverId, message) async {
    //get current user info
    final String currentUserId = auth.currentUser!.uid;
    final String currentUserEmail = auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      
      message: message,
      timestamp: timestamp,
    );
    //construct a chat room ID for the two users (sorted to ensure uniqueness)

    List<String> ids = [currentUserId, receiverId];
    ids.sort();

    String chatRoomID = ids.join();
print(newMessage.message);
    //add new message to database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // get message
  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    //construct a chatroom ID for the two users
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomID = ids.join();
    print("chatRoomID");
    print(chatRoomID);


    return _firestore
        .collection("chat_roooms")
        .doc(chatRoomID)
        .collection("messages")
        .snapshots();
  }
}
