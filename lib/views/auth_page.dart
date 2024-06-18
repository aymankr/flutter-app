import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/auth_view_model.dart';
import 'widgets/auth_form.dart';
import 'widgets/footer.dart';
import 'task_page.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(authViewModel.isLogin ? 'Login' : 'Sign Up'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://source.unsplash.com/random',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),
          ),
          Center(
            child: AuthForm(),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class AuthForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Simule l'authentification et la navigation vers TaskPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TaskPage()),
            );
          },
          child: Text(authViewModel.isLogin ? 'Login' : 'Sign Up'),
        ),
        TextButton(
          onPressed: () {
            authViewModel.toggleLogin();
          },
          child: Text(
            authViewModel.isLogin
                ? "Don't have an account? Sign Up"
                : 'Already have an account? Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
