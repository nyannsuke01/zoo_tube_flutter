import 'package:flutter/material.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../presentation/provider/Provider.dart';
//
// // ConsumerWidgetでProviderから値を受け渡す
// class LoginPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     // Providerから値を受け取る
//     final infoText = watch(infoTextProvider).state;
//     final email = watch(emailProvider).state;
//     final password = watch(passwordProvider).state;
//
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'メールアドレス'),
//                 onChanged: (String value) {
//                   // Providerから値を更新
//                   context.read(emailProvider).state = value;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'パスワード'),
//                 obscureText: true,
//                 onChanged: (String value) {
//                   // Providerから値を更新
//                   context.read(passwordProvider).state = value;
//                 },
//               ),
//               Container(
//                 padding: EdgeInsets.all(8),
//                 child: Text(infoText),
//               ),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   child: Text('ユーザー登録'),
//                   onPressed: () async {
//                     try {
//                       final FirebaseAuth auth = FirebaseAuth.instance;
//                       final result = await auth.createUserWithEmailAndPassword(
//                         email: email,
//                         password: password,
//                       );
//                       // ユーザー情報を更新
//                       context.read(userProvider).state = result.user;
//
//                       await Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) {
//                           return ChatPage();
//                         }),
//                       );
//                     } catch (e) {
//                       // Providerから値を更新
//                       context.read(infoTextProvider).state =
//                       "登録に失敗しました：${e.toString()}";
//                     }
//                   },
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 width: double.infinity,
//                 child: OutlinedButton(
//                   child: Text('ログイン'),
//                   onPressed: () async {
//                     try {
//                       final FirebaseAuth auth = FirebaseAuth.instance;
//                       await auth.signInWithEmailAndPassword(
//                         email: email,
//                         password: password,
//                       );
//                       await Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) {
//                           return ChatPage();
//                         }),
//                       );
//                     } catch (e) {
//                       // Providerから値を更新
//                       context.read(infoTextProvider).state =
//                       "ログインに失敗しました：${e.toString()}";
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // ConsumerWidgetでProviderから値を受け渡す
// class ChatPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     // Providerから値を受け取る
//     final User user = watch(userProvider).state!;
//     final AsyncValue<QuerySnapshot> asyncPostsQuery = watch(postsQueryProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('チャット'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.close),
//             onPressed: () async {
//               await FirebaseAuth.instance.signOut();
//               await Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) {
//                   return LoginPage();
//                 }),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             child: Text('ログイン情報：${user.email}'),
//           ),
//           Expanded(
//             // StreamProviderから受け取った値は .when() で状態に応じて出し分けできる
//             child: asyncPostsQuery.when(
//               // 値が取得できたとき
//               data: (QuerySnapshot query) {
//                 return ListView(
//                   children: query.docs.map((document) {
//                     return Card(
//                       child: ListTile(
//                         title: Text(document['text']),
//                         subtitle: Text(document['email']),
//                         trailing: document['email'] == user.email
//                             ? IconButton(
//                           icon: Icon(Icons.delete),
//                           onPressed: () async {
//                             // 投稿メッセージのドキュメントを削除
//                             await FirebaseFirestore.instance
//                                 .collection('posts')
//                                 .doc(document.id)
//                                 .delete();
//                           },
//                         )
//                             : null,
//                       ),
//                     );
//                   }).toList(),
//                 );
//               },
//               // 値が読込中のとき
//               loading: () {
//                 return Center(
//                   child: Text('読込中...'),
//                 );
//               },
//               // 値の取得に失敗したとき
//               error: (e, stackTrace) {
//                 return Center(
//                   child: Text(e.toString()),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () async {
//           await Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) {
//               return AddPostPage();
//             }),
//           );
//         },
//       ),
//     );
//   }
// }
//
// // ConsumerWidgetでProviderから値を受け渡す
// class AddPostPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     // Providerから値を受け取る
//     final user = watch(userProvider).state!;
//     final messageText = watch(messageTextProvider).state;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('チャット投稿'),
//       ),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(32),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: '投稿メッセージ'),
//                 keyboardType: TextInputType.multiline,
//                 maxLines: 3,
//                 onChanged: (String value) {
//                   // Providerから値を更新
//                   context.read(messageTextProvider).state = value;
//                 },
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   child: Text('投稿'),
//                   onPressed: () async {
//                     final date = DateTime.now().toLocal().toIso8601String();
//                     final email = user.email;
//                     await FirebaseFirestore.instance
//                         .collection('posts')
//                         .doc()
//                         .set({
//                       'text': messageText,
//                       'email': email,
//                       'date': date
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
