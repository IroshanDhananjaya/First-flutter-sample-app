import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_project/splash.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

final getStorage=GetStorage();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), (() {
      if(getStorage.read("id")!=null){
         Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  HomePage()));
      }else{
         Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  LoginPage()));
      }
     
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo1.png',
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            if (Platform.isIOS)
              CircularProgressIndicator(
                color: Colors.white,
              )
            else
              CupertinoActivityIndicator(
                radius: 30,
              )
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final getStorage=GetStorage();
  //const LoginPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
          width: double.infinity,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo1.png',
                height: 250,
              ),
              Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 40),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                //   borderSide: BorderSide(width: 2),
                                //   borderRadius: BorderRadius.circular(50.0),
                                ),
                            hintText: 'Enter Your Name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            border: OutlineInputBorder(
                                // borderSide:
                                //     BorderSide(width: 20, color: Colors.black),
                                // borderRadius: BorderRadius.circular(50.0),
                                ),
                            hintText: 'Enter Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 530,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 9, 29, 145),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            getStorage.write("id", "1");
                            getStorage.write("name", "Iroshan");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  HomePage()));
                          },
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}

class HomePage extends StatelessWidget {
  //const HomePage({super.key});
  final getStorage=GetStorage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          
        ),
        // body:WebView(
        //   initialUrl: "https://iroshandhananjaya.netlify.app/",
        //   javascriptMode: JavascriptMode.unrestricted,
        //)
        body:  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 9, 29, 145),
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            getStorage.erase();
                            Navigator.pushReplacement(
                              
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  LoginPage()));
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),

      ),
    );
  }
}
