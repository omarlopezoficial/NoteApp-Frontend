
import 'package:flutter/material.dart';
import '../../../config/theme/app_theme.dart';
import '../home/home_screen.dart';
//import 'package:note_app_frontend/domain/entities/usuario.dart';

//import 'package:http/http.dart' as http;
//import 'dashboard_screen.dart';
//import 'dart:convert';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

   /* Future<Usuario> getUser() async {
    var url = Uri.http('https://f3f1-200-8-55-134.ngrok-free.app/notes');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        final user = jsonDecode(response.body);
        return user;
      } else {
        print("Error");
        throw Exception("Fallo la conexion");
      }
    } catch (e) {
      print(e);
      throw Exception("Fallo la conexion");
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgGray,

      //AppBar (Icon arrow)
      appBar: AppBar(
        backgroundColor: AppTheme.bgGray,
        elevation: 0,
        automaticallyImplyLeading: false,
        /* leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Color(0XFF000000)),
        ), */
      ),
      
      body: SafeArea(
        child: Padding(padding:const EdgeInsets.only(top: 55, bottom: 100.0),
          child: Column(
              children: <Widget> [
          
                //Imagen principal
                Image.asset("assets/NoteAppD.png",
                  width: 235,
                  fit: BoxFit.cover,
                ),const Spacer(),
              
          
                //Imagen Nombre App
                Image.asset("assets/my_notes_app.png",
                  width: 140,
                  fit: BoxFit.cover,
                ),const Spacer(),
                

                //Button 'iniciar sesion'
                Padding(padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20, bottom: 15),
                child: Row(
                  children: [ Expanded(
                      child: MaterialButton(
                        color: const Color(0xFFEDC123),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),

                        //Navigator
                        onPressed: () {
                          //final Future<Usuario> user = getUser();
                          final route = MaterialPageRoute(builder:(context) =>  const HomeScreen());
                          Navigator.pushReplacement(context, route); 
                        },

                        child: Padding(padding: const EdgeInsets.all(12.0),
                          child: Column(children: <Widget>[ 
                              Text(
                                "Iniciar Sesión",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //const Spacer(),


              //Button 'iniciar sesion premium'
                Padding(padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20, bottom: 30),
                child: Row(
                  children: [ Expanded(
                      child: MaterialButton(
                        color: const Color(0xFFEDC123),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),

                        //Navigator
                        onPressed: () {
                          /* final Future<Usuario> user = getUser();
                          final route = MaterialPageRoute(builder: (context) => const HomeScreen());
                          Navigator.pushReplacement(context, route); */
                        },

                        child: Padding(padding: const EdgeInsets.all(12.0),
                          child: Column(children: <Widget>[ 
                              Text(
                                "Iniciar Sesión Premium",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), const Spacer(),
              

              ],
            ),
          ),
        ),
   );
  }
}