import 'package:crud_com_bancos_diferentes/views/formulario.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aero Info',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => DadosAviao(),
        //'/login_page': (context) => LoginPage(),
      },
    );
  }
}

        
        
        
        
        
        
