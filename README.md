# cryptomoedas

Aprendendo flutter.


### Ciclo de vida do Flutter 

Ao mutar o estado com setState o 
flutter chama o build novamente. 

Árvore - 
 - CreateState() -> Cria um estado inicial para o widget. 

 - initState(): Bom momento para consumir API'S

 - didChangeDependencies() -> essa função no cilco de vida verifica se todos os objetos exeternos que estão sendo utilzados já estão instânciados. 

 - STATE -> é o objeto de estado do widget. 
 - build()  -> Esse método é chamado para construir a WIDGET 

 - Widget -> depois que a Widget foi construida agora há um objeto widget. 
 - setState() -> Tendo toda essa interface criada o setState poderá ser chamada para alterar o estado do objeto state que chamaráa a função ```build()``` novamente e vai reiniciar a árvore apartir no Build().

 - didUpdateWidget() -> Quando há uma atualização em um widgetPai o widget filho chamará essa função para re-construir o seu estado. 

- deactivate() -> Essa função é chamada quando o widget é removido da árvore de widgets porém não é destruído, um exemplo é a navegação entre página de que você pode voltar para a página inicial quando está em subpáginas. 

 - dispose(): Este método é chamado quando o widget é removido permanentemente na árvore. 

 ### Método build com uma melhor performace. 
 https://www.youtube.com/watch?v=2gH8izRD-Io&list=PL_wKlpKIC9vWCRIgMvH8pbRmX8XVouRv1&index=7


### Navegação entre rotas 

Para a navegação entre rotas no flutter
é utilizado o ```Navigator.push(context, (_) => meuWidgetPagina())``` 
feito isso é possível até passar dados através da rota. 

### Formulários 

