import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubimit;
  const AuthForm({super.key, required this.onSubimit});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _Submit() {
    final isValid = _formkey.currentState?.validate() ?? false;
    if (!isValid) return;

    widget.onSubimit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              if (_formData.isSignup)
                TextFormField(
                  key: const ValueKey('name'),
                  initialValue: _formData.name,
                  onChanged: (name) => _formData.name,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (_name) {
                    final name = _name ?? '';
                    if (name.trim().length < 5) {
                      return 'Nome deve ter no mínimo 5 caracteres';
                    }
                    return null;
                  },
                ),
              TextFormField(
                key: const ValueKey('E-mail'),
                initialValue: _formData.email,
                onChanged: (email) => _formData.email,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (_email) {
                  final email = _email ?? '';
                  if (!email.contains('@')) {
                    return 'E-mail informado não é válido. ';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: const ValueKey('password'),
                initialValue: _formData.password,
                onChanged: (password) => _formData.password,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.length < 6) {
                    return 'Senha eeve ter no mínimo 6 caracteres ';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: _Submit,
                child: Text(
                  _formData.isLogin ? 'Entrar' : 'Cadastrar',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
                child: Text(
                  _formData.isLogin
                      ? 'Criar uma nova conta ?'
                      : 'Já possui conta?',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
