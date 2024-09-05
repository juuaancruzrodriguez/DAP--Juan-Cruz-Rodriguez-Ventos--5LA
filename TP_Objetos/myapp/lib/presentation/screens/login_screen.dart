import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/User.dart';

TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();


List usuarios = [
  User(email: "SantiDP", password: "Pass1"),
  User(email: "JuanCruz", password: "Pass2"),
  User(email: "Feli", password: "Pass3"),
  User(email: "SantiVidal", password: "Pass4"),
  User(email: "Facundo", password: "Pass5")
];
var logged = false;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Logueo",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: 'Usuario',
                  icon: Icon(Icons.person)
                  ),
              ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  icon: Icon(Icons.key)
                  ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  for(var usuario in usuarios){
                    if(usuario.email == userController.text && usuario.password == passController.text){
                      context.go('/home/${userController.text}');
                      logged = true;
                      break;
                    }
                    else if(userController.text == '' && passController.text == '' && usuarios.last == usuario){
                      SnackBar snackBar = const SnackBar(
                        content: Text("Usuario y Contraseña Vacios"),
                        duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else if(userController.text == '' && usuarios.last == usuario){
                      SnackBar snackBar = const SnackBar(
                        content: Text("Usuario Vacio"),
                        duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else if(passController.text == '' && usuarios.last == usuario){
                      SnackBar snackBar = const SnackBar(
                        content: Text("Contraseña Vacia"),
                        duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else if(logged == false && usuarios.last == usuario){
                      SnackBar snackBar = const SnackBar(
                        content: Text("Usuario o Contraseña Incorrecto"),
                        duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                  logged = false;
                }, 
                child: const Text("Login")
              ),
            ],
          )
        )
    );
  }
}