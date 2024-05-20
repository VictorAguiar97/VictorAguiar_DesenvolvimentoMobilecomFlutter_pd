import 'package:auto_control_panel/providers/auth_provider.dart';
import 'package:auto_control_panel/providers/tarefas_provider.dart';
import 'package:auto_control_panel/screens/edit_screen.dart';
import 'package:auto_control_panel/screens/signin_screen.dart';
import 'package:auto_control_panel/screens/signup_screen.dart';
import 'package:auto_control_panel/routes.dart';
import 'package:auto_control_panel/screens/about_screen.dart';
import 'package:auto_control_panel/screens/details_screen.dart';
import 'package:auto_control_panel/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TarefasProvider>(
            create: (context) => TarefasProvider()),
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Login Tarefas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        ),
        routes: {
          Routes.SIGNIN: (context) => SigninScreen(),
          Routes.SIGNUP: (context) => const SignupScreen(),
          Routes.HOME: (context) => const HomeScreen(),
          'about_screen': (context) => const AboutScreen(),
          'details_screen': (context) => const DetailsScreen(),
          Routes.FORM: (context) => const FormScreen(),
          Routes.EDIT_FORM: (context) => const EditScreen(),
        },
      ),
    );
  }
}
