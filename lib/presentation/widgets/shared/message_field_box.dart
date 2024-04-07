import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  // Toma el onFieldSubmitted del MessageFieldBox y lo parametiza
  // Finalidad: No amarrar el MessageFieldBox a un solo provider, recibe la informacion en otro lado
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    // Los estilos
    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(color: colors.secondary));
    final inputDecoration = InputDecoration(
        hintText: 'Envia un mensaje que termine con "?"',
        hintStyle: const TextStyle(fontStyle: FontStyle.italic),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
        ));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onTapOutside: (event) => focusNode.unfocus(),
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          textController.clear();
          focusNode.requestFocus();
          onValue(value);
        }),
    );
  }
}
