
import 'package:flutter/material.dart'; 
import 'package:cryptomoedas/pages/CryptoPage.dart';

class MeuApp extends StatelessWidget 
{
  const MeuApp({Key? key}): super(key: key); 

  @override 
  Widget build(BuildContext Context)
  {
    return MaterialApp(
      title: "Crypto Base",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.indigo,
        primaryColor: Colors.indigo[800]
      ),
      home: CryptoPage(), 
    );
  }
}