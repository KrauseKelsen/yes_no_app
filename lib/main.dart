import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';


// En esta app se hace uso de: Providers, Imagenes, Dio (https), Factory, Mappers, AppTheme, ValueChanged
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Esto envuelve toda la app en el provider, para que todos sus hijos puedan usar el gestor de estado
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).theme(),
        title: 'Yes No App',
        home: const ChatScreen()
      ),
    );
  }
}