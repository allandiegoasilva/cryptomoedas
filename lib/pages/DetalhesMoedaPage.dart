import 'package:flutter/material.dart';
import 'package:cryptomoedas/models/moeda.dart';
import 'package:flutter/services.dart'; 
import 'package:intl/intl.dart'; 

class DetalhesMoedaPage extends StatefulWidget {

  Moeda moeda; 

  DetalhesMoedaPage({Key? key, required this.moeda}) : super(key: key);

  @override 
  _DetalhesMoedaPageState createState() => _DetalhesMoedaPageState(); 
}

class _DetalhesMoedaPageState extends State<DetalhesMoedaPage>{
  @override 

  final _form = GlobalKey<FormState>(); 
  final _valor = TextEditingController();
  double quantidade = 0; 

  comprar(){
    if(_form.currentState!.validate()){
      // Salvar a compra 
      Navigator.pop(context); 
      ScaffoldMessenger.of(context).showSnackBar( 
        SnackBar(content: Text('Compra realizada com sucesso!'))
      ); 
    }
  }

  Widget build(BuildContext context){

    NumberFormat real =NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moeda.nome),
      ),
      body: Column(
        children: [
           Padding(
             padding: EdgeInsets.all(16.0),
             child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(
                child: Image.asset(widget.moeda.icone),
                width: 100,
                height: 100,
              ),
              Text(
                real.format(widget.moeda.preco),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                  fontSize: 26,
                  letterSpacing: -1
                ),
              )
            ],
          ),
         
            ),
           quantidade > 0 ? Padding(
             padding: EdgeInsets.all(16.0),
             child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          child: Text('$quantidade ${widget.moeda.sigla}',
                            style: TextStyle(
                              fontSize: 20, 
                              color: Colors.teal
                            ),
                          ) 
                          ),
                      ), 
           
           ) : Container(
             margin: EdgeInsets.only(bottom: 24),
           ),
           Padding( 
            padding: EdgeInsets.only(left: 16.0),
            child: Form(
            key: _form, 
            child: TextFormField(
              controller: _valor,
              style: TextStyle(fontSize: 22),
              decoration: InputDecoration(
                border: OutlineInputBorder(), 
                labelText: 'Valor',
                prefixIcon: Icon(Icons.monetization_on),
                suffix: Text(
                  "reais", 
                  style: TextStyle(
                    fontSize: 14 
                  ),
                )
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value){
                if(value!.isEmpty){
                  return 'Informe o valor da compra'; 
                }
                else if(double.parse(value) < 50){
                  return 'Informe um valor superior a R\$ 50,00'; 
                }

                return null; 
              },
              onChanged: (value){
                setState(() {
                  quantidade = (value.isEmpty) ? 0 : double.parse(value) / widget.moeda.preco; 
                });
              },
             )
            ),
           ),
           Padding(
             padding: EdgeInsets.all(3),
             child: Container(
               alignment: Alignment.bottomCenter,
               margin: EdgeInsets.only(top:24),
               child: ElevatedButton( 
                 onPressed:  comprar(),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.check),
                     Text('Comprar', 
                      style: TextStyle(fontSize: 20 ),
                     )
                   ],
                 ),
               ),
             ),
           )
        ],
      ),
    ); 
  }
}