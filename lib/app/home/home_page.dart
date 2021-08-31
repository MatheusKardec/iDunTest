import 'package:app_teste/app/home/widget/item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'controller/controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = GetIt.I.get<Controller>();
  TextEditingController _guidController = TextEditingController();
  TextEditingController _textController = TextEditingController();

  

  @override
  void initState() {
    controller.getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: Text("iDun Test"),
      ),
      body: Observer(
        builder:(_)=>  controller.load ? ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (BuildContext context, index){
            return ItemListWidget(item: controller.list[index]);
          },
        ): Center(
          child: CircularProgressIndicator()
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        onPressed: (){

          _guidController.text = "";
          _textController.text = "";

          InputDecoration inputdecoration  = InputDecoration(
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
            ),
          );

          TextStyle tStyle = TextStyle(
            color: Theme.of(context).primaryColor, fontSize: 15, fontWeight: FontWeight.bold
          );

          ButtonStyle bStyle(Color colorB)=> ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorB),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            )
          );
          

          showDialog(
            context: context, 
            builder: (BuildContext context)=> Dialog(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Criar uma nova postagem", textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      //
                      Text( "Guid", style: tStyle ),

                      TextField(
                        controller: _guidController,
                        decoration: inputdecoration
                      ),

                      SizedBox(height: 12,),

                      Text("Text", style: tStyle),

                      TextField(
                        controller: _textController,
                        decoration: inputdecoration
                      ),

                      SizedBox(height: 12,),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: bStyle(Colors.red),
                              onPressed: ()=> Navigator.pop(context),
                              child: Container(
                                height: 40,
                                child: Center(child: Text('Cancelar', style: TextStyle(fontSize: 20),))
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: ElevatedButton(
                              style: bStyle(Theme.of(context).primaryColor),
                              onPressed: () {
                                controller.createItem(_guidController.text, _textController.text);
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                child: Center(child: Text('Adicionar', style: TextStyle(fontSize: 20),))
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          );



        }, 
        label: Text("Nova postagem")
      )
    );
  }
}
