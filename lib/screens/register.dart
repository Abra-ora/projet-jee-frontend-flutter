import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studi_kasus/screens/home.dart';
import 'package:studi_kasus/screens/login.dart';
import '../api.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isShowPwd = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController FNController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool passwordConfrimationVisible = false;
  String username;
  String email;
  String password;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    FNController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void Validate() {
      if (!_formKey.currentState.validate()) {
        _formKey.currentState.save();
      }
    }

    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 85),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Register',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  key: Key('Username'),
                  controller: FNController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter your username';
                    }
                    this.username = FNController.text;
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  key: Key('Email address'),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (value.isEmpty) {
                      return 'Enter your email address';
                    } else if (!emailValid) {
                      return 'Invalid email address';
                    }
                    this.email = emailController.text;
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  key: Key('Password'),
                  controller: pwdController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: (_isShowPwd) ? false : true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _isShowPwd = !_isShowPwd;
                        });
                      },
                      child: _isShowPwd
                          ? Icon(
                              Icons.visibility,
                              color: Theme.of(context).primaryColor,
                            )
                          : Icon(Icons.visibility_off,
                              color: Theme.of(context).primaryColor),
                    ),
                  ),
                  validator: (value) {
                    if (value.length < 6) {
                      this.password = null;
                      return 'Require more than 6 caracteres';
                    } else if (value.isEmpty) {
                      this.password = null;
                      return 'Empty Field';
                    }
                    this.password = pwdController.text;
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF645AFF),
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      Validate();
                      if (email != null &&
                          username != null &&
                          password != null) {
                        final Map<String, dynamic> data = {
                          'username': username,
                          'email': email,
                          'password': password,
                        };
                        var response = await api().register(data);
                        if (response.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("account successfully created"),
                          ));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Iinternal server error !!!"),
                          ));
                        }
                      }
                    },
                    child: Center(
                      child: Text(
                        'REGISTER',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Text(
                    '_____OR_____',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.headline6,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF645AFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
