import 'package:auto_control_panel/providers/auth_provider.dart';
import 'package:auto_control_panel/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();

    //final mediaQuery = MediaQuery.of(context);
    //final larguraDisponivel = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 30.0, // Change the font size as per your need
          ),
        ),
        centerTitle: true, // Center the title text
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'email@email.com.br',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Senha',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;
                if (email.isEmpty || password.isEmpty) {
                  return;
                }

                await authProvider.signIn(email, password).then((sucesso) {
                  if (sucesso) {
                    Navigator.pushReplacementNamed(context, Routes.HOME);
                  } else {
                    if (authProvider.message != null) {
                      Text(authProvider.message!);
                    }
                  }
                });
              },
              child: const Text("Acessar"),
            ),
            if (authProvider.message != null) Text(authProvider.message!),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.SIGNUP);
                },
                child: const Text("Ainda não tenho cadastro!"))
          ],
        ),
      ),
    );
  }
}
