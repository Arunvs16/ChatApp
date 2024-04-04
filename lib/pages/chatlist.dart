// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class CHatList extends StatefulWidget {
//   const CHatList({super.key});

//   @override
//   State<CHatList> createState() => _CHatListState();
// }

// class _CHatListState extends State<CHatList> {
//   @override
//   void initState() {
//     setData();
//     // TODO: implement initState
//     super.initState();
//   }

// void setData() {
//     // Get a reference to the collection 'users'
//     CollectionReference users = FirebaseFirestore.instance.collection('messages');

//     // Set data using a DocumentReference
//     users.add(
//         {
//           "message":'eeee',
//           "name":"ram",
//           'timeStamp':DateTime.now.toString()
//         })
//         .then((value) => print("Data set successfully"))
//         .catchError((error) => print("Failed to set data: $error"));
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         builder: (context, snapshot) {
//           return ListView.builder(itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               return Row(mainAxisAlignment:  snapshot.data!.docs[index]['name']=='sam'?MainAxisAlignment.end:MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     child: Column(
//                       children: [
//                         Text(snapshot.data!.docs[index]['message']),
//                         // Text(''),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         stream: FirebaseFirestore.instance.collection('messages').orderBy('timeStamp').snapshots(),
//       ),
//     );
//   }
// }
