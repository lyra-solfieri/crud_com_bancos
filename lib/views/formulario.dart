import 'package:flutter/material.dart';

class DadosAviao extends StatelessWidget {
  DadosAviao({Key? key}) : super(key: key);

  final _nomeAviao = TextEditingController();
  final _anoAviao = TextEditingController();
  final _paisAviao = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Cadastre Aviões do mundo"),
      backgroundColor: Colors.red,
    ),
    body: _body(context),
    );
  }

   _body(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            nomeAviaoForm(),
            anoAviaoForm(),
            paisAviaoForm(),
            gravarButton(context),
           
          ],
        ));
  }

  Container  nomeAviaoForm() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
            controller: _nomeAviao,
            validator: (valor) {
              RegExp regex = RegExp(r'^.{5,}$');
              if (valor!.isEmpty) {
                return 'Digite o nome completo da nave';
              }
              if (!regex.hasMatch(valor)) {
                return 'Nome tem que ter mais de 5 caracteres';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nome do Avião",
                labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                hintText: "Informe o nome")));
  }


  Container anoAviaoForm() {
    return Container(
        padding:  const EdgeInsets.all(10),
        child: TextFormField(
          controller: _anoAviao,
          validator: (valor) {
            if (valor!.isEmpty) {
              return 'Digite o ano do avião';
            }

            return null;
          },
          obscureText: false,
          keyboardType: TextInputType.datetime,
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Ano",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe o ano",
          ),
        ));
  }

  Container  paisAviaoForm() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
            controller: _paisAviao,
            keyboardType: TextInputType.text,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "País do Avião",
                labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                hintText: "País")));
           
  }

  Container gravarButton(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(55),
      child: ElevatedButton(
        onPressed: () => {
          
          // Aqui eu direciono para outra page onde irei
          // colocar os 3 button para cada banco
          // Ou eu mostro um pop-up com button
        },
        style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all( const EdgeInsets.all(20)),
                textStyle: MaterialStateProperty.all( const TextStyle(fontSize: 30))),
        child: const Text('Gravar dados'),
      ),

    );

  }

 

}

  





 
