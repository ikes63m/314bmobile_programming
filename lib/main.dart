import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text(
            'LOGIN SCREEN',
            style: TextStyle(color: Colors.yellowAccent, fontSize: 20),
          ),
        ),
        body: const Padding(padding: EdgeInsets.all(16.0), child: LoginForm()),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Login Screen',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text('Username'),
        TextField(controller: _usernameController),
        const SizedBox(height: 12),
        const Text('Password'),
        TextField(controller: _passwordController, obscureText: true),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            // TODO: handle login
            final username = _usernameController.text;
            final password = _passwordController.text;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Username: $username, Password: $password'),
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text('Login'),
          ),
        ),
      ],
    );
  }
}
