import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

//Provider: Gestor de estado
//ChangeNotifier: Notifica cuando hay cambios
class ChatProvider extends ChangeNotifier {
  final getYesNoAnswer = GetYesNoAnswer();
  final chatScrollController = ScrollController();
  List<Message> messageList = [

  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);
    if (text.endsWith('?')) herReply();

    // Es el setState() de los Widgets, notifica a todos los que hereden su provider que ha habido un cambio (.wath<ChatProvider>)
    notifyListeners();
    moveScrollToButtom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToButtom();
  }

  void moveScrollToButtom() {
    chatScrollController.animateTo(
        chatScrollController
            .position.maxScrollExtent, // el scroll va hacia abajo en max
        duration: const Duration(microseconds: 100),
        curve: Curves.easeOut);
  }
}
