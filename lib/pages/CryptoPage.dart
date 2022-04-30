import 'package:cryptomoedas/repositories/moeda_repository.dart';
import 'package:cryptomoedas/models/moeda.dart'; 
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class CryptoPage extends StatefulWidget 
{
  const CryptoPage({Key? key}) : super(key: key);

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  @override 

  
  final moedas = MoedaRepository.moedas; 
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  
  List<Moeda> selecionadas = []; 
  
  appBarDinamica(){

    if(selecionadas.isEmpty){
       return AppBar(
                title: Text('Cripto Moedas'),
              );
    }
    else {
      return AppBar(
        title: Text("${selecionadas.length} selecionadas", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.blueGrey[50],
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),

        leading: IconButton(icon: Icon(Icons.arrow_back),
                       onPressed: (){
                         setState(() {
                           selecionadas = []; 
                         });
                       },
        ),
      ); 
    }
  }

  Widget build(BuildContext context )
  {
    return Scaffold(
      appBar: appBarDinamica(), 
      body: ListView.separated(itemBuilder: (BuildContext context, int moeda){
        return ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          
          leading: !(selecionadas.contains(moedas[moeda]))
                   ?SizedBox(
                      child: Image.asset(moedas[moeda].icone),
                      width: 66,
                      height: 66
                    )
                    : CircleAvatar(
                     child: Icon(Icons.check),
                    ),
          title: Text(moedas[moeda].nome, 
          style: TextStyle(
            fontSize: 17, 
            fontWeight: FontWeight.w500, 
            color: Colors.black38
           )
          ),
          trailing: Text(real.format(moedas[moeda].preco)),
          selected: selecionadas.contains(moedas[moeda]),
          selectedTileColor: Colors.indigo[50],
          onLongPress: () {
            setState(() {
              selecionadas.contains(moedas[moeda]) 
              ? selecionadas.remove(moedas[moeda])
              : selecionadas.add(moedas[moeda]);
              
            });
          },
          onTap: (){
            if(selecionadas.contains(moedas[moeda]))
            {
              setState(() {
                selecionadas.remove(moedas[moeda]); 
              });
            }
          },
        ); 
      }, 
                               padding: EdgeInsets.all(16),
                               separatorBuilder: (_,__) => Divider(), 
                               itemCount: moedas.length
                              )
      ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isNotEmpty ? FloatingActionButton.extended(
        onPressed: () { },
        
        icon: Icon(Icons.star),
        label: Text("Favoritar", 
         style: TextStyle(
           letterSpacing: 0, 
           fontWeight: FontWeight.bold
         ),
         )
        ) 
        : null,
    );
  }
}