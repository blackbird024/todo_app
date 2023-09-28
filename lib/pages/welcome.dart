import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeApp extends StatefulWidget {
  const WelcomeApp({super.key, required String title});

  @override
  State<WelcomeApp> createState() => _WelcomeAppState();
}

class _WelcomeAppState extends State<WelcomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
               Padding(
                padding: EdgeInsets.all(60.0),
                child: Text(
                  "Welcome to ToDoApp",
                  style: GoogleFonts.almendraSc(
                    letterSpacing: 2.5,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // imagen
              Image.asset(
                "assets/icon/icon.png",
                scale: 4.0,
              ),

              // texto explicativo
              Padding(
                padding: EdgeInsets.all(30.0),
              child: Text(

                "You can create and delete daily tasks",
                style: GoogleFonts.almendraSc(


                  letterSpacing: 2.5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),

              ),),

              // Botón Comenzar
              Padding(
                padding: EdgeInsets.all(80.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/route2");
                  },
                  child: Text(
                    "Comenzar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
