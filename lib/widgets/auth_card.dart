import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _submit() {
    if (!_form.currentState.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState.save();

    if (_authMode == AuthMode.Login) {
      // Login
    } else {
      // Registrar
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _swicthAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.all(16),
          height: _authMode == AuthMode.Login ? 300 : 320,
          width: deviceSize.width * 0.75,
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Informe um e-mail válido';
                    }
                    return null;
                  },
                  onSaved: (value) => _authData['email'] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Informe um senha válida!';
                    }
                    return null;
                  },
                  onSaved: (value) => _authData['senha'] = value,
                ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Confirmar Senha'),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Senha são diferentes!';
                            }
                            return null;
                          }
                        : null,
                  ),
                Spacer(),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  RaisedButton(
                    child: Text(
                      _authMode == AuthMode.Login ? 'Entrar' : 'REGISTRAR',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryTextTheme.button.color,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    onPressed: _submit,
                  ),
                FlatButton(
                  onPressed: _swicthAuthMode,
                  child: Text(_authMode == AuthMode.Login
                      ? 'CRIAR CONTA'
                      : 'FAZER LOGIN'),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
