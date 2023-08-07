import 'package:flutter/material.dart';
import 'package:flutter_keep/common/utility_function.dart';
import 'package:flutter_keep/constants/global_variables.dart';
import 'package:flutter_keep/features/auth/service/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService authService = new AuthService();
  bool showPassword = false;
  final _loginKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  void changeShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // authService.login(email: "chiragthapa777@gmail.com", password: "123456", ctx: context);
  }

  String? emailValidator(String? val) {
    if (val == null || val == '') {
      return "Email is required";
    }
    if (!UtilityFunction.isValidEmail(val)) {
      return "Email is invalid";
    }
    return null;
  }

  void handleLogin() {
    bool isValid = _loginKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.primaryBg,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Flutter-Keep",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: GlobalVariables.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                cursorColor: GlobalVariables.primary,
                maxLength: 20,
                validator: emailValidator,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: GlobalVariables.primaryLg,
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: GlobalVariables.primary,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: GlobalVariables.primary),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: GlobalVariables.primary),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                cursorColor: GlobalVariables.primary,
                obscureText: showPassword,
                maxLength: 20,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.password_outlined,
                    color: GlobalVariables.primaryLg,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      changeShowPassword();
                    },
                    child: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                      color: GlobalVariables.primaryLg,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: GlobalVariables.primary,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: GlobalVariables.primary),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: GlobalVariables.primaryLg),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    backgroundColor: GlobalVariables.primary),
                onPressed: () {
                  handleLogin();
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Click here to register",
                      style: TextStyle(
                          color: GlobalVariables.primaryLg,
                          decoration: TextDecoration.underline),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
