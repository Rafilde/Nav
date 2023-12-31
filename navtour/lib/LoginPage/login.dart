import 'package:flutter/material.dart';
import 'package:navtour/registerPage/register.dart';
import 'package:navtour/HomePage/homePage.dart';
import 'package:navtour/services/auth_service.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, 0),
            radius: 1,
            colors: [
              Color.fromARGB(255, 5, 158, 2),
              Color.fromARGB(255, 0, 58, 1)
            ], //Color.fromARGB(255, 2, 129, 158), Color.fromARGB(255, 0, 13, 58)
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 28, right: 28),
          child: Center(
            child: Container(
              //width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(28),
              //vai fazer o container aumenta a medida que eu coloco coisa
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Inserir email";
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                              .hasMatch(value!)) {
                            return "Email inválido";
                          } else {
                            return null;
                          }
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                //fontFamily: ,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            contentPadding: EdgeInsets.only(
                                top: 10) // Remova o preenchimento vertical
                            ),
                      ),
                      SizedBox(height: 32.0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Inserir senha";
                          } else {
                            return null;
                          }
                        },
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(
                              //fontFamily: ,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          contentPadding: EdgeInsets.only(
                              top: 10), // Remova o preenchimento vertical
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        obscureText: _obscureText,
                      ),
                      SizedBox(height: 32.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              // Adicione a ação que deseja realizar ao pressionar o botão "Cadastrar"
                            },
                            child: Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                color: Color(0xFF737373),
                                fontSize: 14.5,
                              ),
                            )),
                      ),
                      SizedBox(height: 32.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _signIn();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF1246FF),
                          minimumSize: const Size(167, 52),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      SizedBox(height: 32.0),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 0.87,
                              decoration:
                                  BoxDecoration(color: Color(0xFF9B9B9B)),
                            ),
                            const SizedBox(width: 8.66),
                            Container(
                              child: Text(
                                'ou',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 17.56,
                                  //fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.66),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 0.87,
                              decoration:
                                  BoxDecoration(color: Color(0xFF9B9B9B)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.0),
                      // Botão "Entrar com Google"
                      ElevatedButton(
                        onPressed: () {
                          // Adicione a ação para entrar com o Google aqui
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFFFFFF),
                          minimumSize: const Size(167, 52),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://static-00.iconduck.com/assets.00/google-icon-2048x2048-czn3g8x8.png', // Adicione o caminho da imagem do Google
                              height:
                                  24, // Ajuste o tamanho da imagem conforme necessário
                              width: 24,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Entrar com Google',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Botão "Entrar com Apple"
                      ElevatedButton(
                        onPressed: () {
                          // Adicione a ação para entrar com a Apple aqui
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          minimumSize: const Size(167, 52),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Apple_logo_white.svg/1724px-Apple_logo_white.svg.png', // Adicione o caminho da imagem da Apple
                              height:
                                  24, // Ajuste o tamanho da imagem conforme necessário
                              width: 24,
                            ),
                            SizedBox(width: 8.0),
                            Text('Entrar com Apple'),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.0),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => register()));
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Ainda não tem uma conta?',
                                  style: TextStyle(
                                    color: Color(0xFF737373),
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: Color(0xFF777777),
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Cadastrar',
                                  style: TextStyle(
                                    color: Color(0xFFFFAE50),
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    String? user = await _auth.login(email: email, password: password);
    if (user == 'Sucesso') {
      Navigator.pushNamed(context, '/Explorar');
    } else if (user == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${user}')),
      );
      print(user);
    } else if (user == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${user}')),
      );
      print(user);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${user}')),
      );
    }
  }
}
