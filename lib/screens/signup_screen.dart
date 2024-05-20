import 'package:auto_control_panel/providers/auth_provider.dart';
import 'package:auto_control_panel/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.read<AuthProvider>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Column(
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
            onPressed: () {
              String email = emailController.text;
              String password = passwordController.text;
              authProvider.signUp(email, password).then((sucesso) {
                if (sucesso) {
                  Navigator.pushReplacementNamed(context, Routes.HOME);
                } else {
                  if (authProvider.message != null) {
                    Text(authProvider.message!);
                  }
                }
              });
            },
            child: const Text("Cadastrar"),
          )
        ],
      ),
    );
  }
}
