import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});
  var passController = TextEditingController() ;
  var userController = TextEditingController() ;

  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Column (mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            ElevatedButton(
              onPressed: (){
                if ((userController.text == "Ale") && (passController.text == "Anuel2006") ){
                  print("Inicio de sesión exitoso");
      
                }
                else{
                  print("Inicio de sesión fallido");
                }
                }, 
              
              child: const Text('Login'), 

            ),


             TextField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: 'Username',
                icon: Icon(Icons.person_2_outlined),
             ),
            ),

             TextField(
              controller: passController,
              decoration: const InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock_clock_outlined),
              ),
              obscureText: true,
            ),

            

            
        
        
        ],),
      ),
    );
  }
}