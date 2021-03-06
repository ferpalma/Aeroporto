import 'package:aeroinfraero/navegation/routes.dart';
import 'package:aeroinfraero/telas/DetalhesVoo_Screen.dart';
import 'package:aeroinfraero/telas/aeroportos_screen.dart';
import 'package:aeroinfraero/telas/home_screen.dart';
import 'package:aeroinfraero/telas/voos_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AeroFly',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(
          title: 'Flutter AeroFly',
        ),
        initialRoute: '/',
        routes: {
          Rotas.HOME_SCREEN: (context) => HomeScreen(),
          Rotas.HOME_SCREEN_FULL: (context) => HomeScreen(),
          //Rotas.VOOS_SCREEN: (context) => VoosScreen(),
          //Rotas.AEROPORTOS_SCREEN: (context) => AeroportosScreen(),
          //Rotas.DETALHESVOO_SCREEN: (context) => DetalhesVooScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff1D70EB), Color(0xffffffff)],
        ),
        navigateAfterSeconds: HomeScreen(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/AeroFlyLogo.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}
