import 'package:flutter/material.dart';
import 'package:studi_kasus/screens/home.dart';
import 'register.dart';
import '../api.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  String email;
  String password;
  bool _isShowPwd;
  // bool _hasError = false;
  // String _errorMessage;

  @override
  void initState() {
    _isShowPwd = false;
    emailController.text = '';
    pwdController.text = '';
  }

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void validate() {
      if (!_formKey.currentState.validate()) {
        _formKey.currentState.save();
      }
    }

    return Scaffold(
      // key: _scaffoldKey,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 140),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  key: Key('Username'),
                  controller: emailController,
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
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                    hintText: 'E-mail',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  key: Key('Password'),
                  controller: pwdController,
                  validator: (value) {
                    if (value.length < 6) {
                      this.password = null;
                      return 'Require more than 6 caracteres';
                    } else if (value.isEmpty) {
                      this.password = null;
                      return 'Please Enter Password !';
                    }
                    this.password = pwdController.text;
                    return null;
                  },
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
                      validate();
                      if (email != null && password != null) {
                        final Map<String, dynamic> data = {
                          'email': email,
                          'password': password,
                        };
                        var response = await api().login(data);
                        if (response.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("You are logged in successfuly"),
                          ));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        } else if (response.statusCode == 406) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Wrong password try again!!!"),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Email not found !!!"),
                          ));
                        }
                      }
                    },
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "You don't have an account yet? ",
                      style: Theme.of(context).textTheme.headline6,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Register',
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
