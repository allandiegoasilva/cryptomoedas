
import 'package:cryptomoedas/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';


class CryptoPage extends StatelessWidget 
{
  const CryptoPage({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context )
  {

    final moedas = MoedaRepository.moedas; 

    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto Moedas"),
      ),
      body: ListView.separated(itemBuilder: (BuildContext context, int moeda){
        return ListTile(
          leading: Image.asset(moedas[moeda].icone),
          title: Text(moedas[moeda].nome),
          trailing: Text(moedas[moeda].preco.toString()),
        ); 
      }, 
                               padding: EdgeInsets.all(16),
                               separatorBuilder: (_,__) => Divider(), 
                               itemCount: moedas.length
                              )
    );
  }
}