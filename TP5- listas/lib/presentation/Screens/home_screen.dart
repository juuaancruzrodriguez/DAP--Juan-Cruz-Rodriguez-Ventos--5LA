
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
static const String name = 'home';

String userName;
 HomeScreen({super.key , this.userName = ""});
  

  @override
  Widget build(BuildContext context) {

   List<String> jugadores = ['Lionel Messi' , 'Rodrigo De Paul' , 'Gonzalo Montiel' , 'Cristian Romero' , 'Emiliano Martinez', 'Lisandro Martinez', 'Marcos Acuña', 'Enzo Fernandez' , 'Leandro Paredes', 'Lautaro Martinez']; 
   List<String> equipos = ['Inter Miami' , 'Atlético de Madrid' , 'Nottinham Forest' , 'Tottenham' , 'Aston Villa', 'Manchester United' , 'Sevilla', 'Chelsea', 'AC Roma','Inter de Milán']; 


    return  Scaffold(
      appBar: AppBar (
        title: const Text('Home')),
      body:  Center(
        child: 
        ListView.builder(
          itemCount: jugadores.length,
          itemBuilder:(context, index) {
            return Card(
              child:ListTile(
                title:Text(jugadores[index]),
                subtitle: Text(equipos[index]), 
            ),
          );
    
        }),

      ),
    );
  }
}