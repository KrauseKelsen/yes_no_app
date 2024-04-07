import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/474x/68/9d/f4/689df4a27a1a9717b130401c880b8a85.jpg'),
          ),
        ),
        title: const Text('Dayana'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Provider: busca estar pendiente de los cambios que ocurren en el ChatProvider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(// Este listView contiene el scroll
                controller: chatProvider.chatScrollController, // Gracias a que el scroll es un parametro puedo trabajarlo para este listview
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble( message : message )
                      : MyMessageBubble( message : message);
                }),
            ),
            MessageFieldBox(
              //onValue: (value) => chatProvider.sendMessage(value) (same line)
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
