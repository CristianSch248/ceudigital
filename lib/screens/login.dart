import 'package:ceudigital/screens/dashboard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Página de Login"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 10),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/img.png'),
                ),
              )
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                    hintText: 'Entre com um E-mail válido.'
                  ),
                  validator: (valor){
                      if(valor == null || valor.isEmpty) {
                        return 'E-mail não informado';
                      }
                      return null;
                  },
                )
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0
                ),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                  ),
                )
            ),
            TextButton(
              onPressed: (){
                print('o desgranhado esqueceu a senha dele');
              },
              child: const Text(
                'Esqueceu sua senha?',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15),
              )
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    Navigator.push(
                        context, MaterialPageRoute(
                          builder: (valor) => Dashboard()
                        )
                    );
                  }
                },
                child: const Text(
                    'login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
