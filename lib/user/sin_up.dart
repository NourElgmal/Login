import 'package:flutter/material.dart';
import 'package:login/user/save.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';
  Future<void> _saveData() async {
    save.Name.addAll({_emailController.text: _nameController.text});
    save.pass.addAll({_emailController.text: _passwordController.text});
    save.email.add(_emailController.text);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!save.email.contains(_emailController.text)) {
        _saveData();
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        setState(() {
          _errorMessage = 'email is already exist';
        });
      }
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.length < 4) {
      return 'Name must be at least 4 characters';
    }
    if (value.contains(RegExp(r'[!@#]'))) {
      return 'Name must not contain special characters like !@#';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || !value.contains('@') || !value.contains('.')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!value.contains(RegExp(r'[!@#]'))) {
      return 'Password must contain at least one special character like !@#';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.cyan, Colors.green])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Name'),
                        validator: _validateName,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: _validateEmail,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: _validatePassword,
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        width: 343,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 200, 71, 244),
                              Color.fromARGB(200, 110, 84, 247),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: _submitForm,
                          child: Text(
                            "Singup",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text(
                          "Already have an account? Signin",
                          style: TextStyle(color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
