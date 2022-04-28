
import 'package:flutter/material.dart';


class CryptoPage extends StatelessWidget 
{
  const CryptoPage({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context )
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto Moedas"),
      ),
      body: Center(
        child: Text("Teste body"),
      ),
    );
  }
}