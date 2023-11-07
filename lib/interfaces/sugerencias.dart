import 'package:crm_dulces/estructuras.dart';
import 'package:crm_dulces/interfaces/menu.dart';
import 'package:crm_dulces/interfaces/widgets.dart';
import 'package:crm_dulces/estilos.dart';
import 'package:crm_dulces/funciones.dart';
import 'package:flutter/material.dart';

class Sugerencias extends StatefulWidget {
  const Sugerencias({super.key});

  @override
  State<Sugerencias> createState() => _SugerenciasState();
}

class _SugerenciasState extends State<Sugerencias> {
  bool modoBusqueda = false;
  bool mostrarAgregar = false;
  TextEditingController controllerBuscador= TextEditingController();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerValor = TextEditingController();
  List<Sugerencia> sugerenciasTemp= [];
  Cliente clienteSelect = clientes.isNotEmpty ? clientes[0] : Cliente("",DateTime(0),DateTime(0)); 

  bool modoEditar = false;
  ScrollController scrollController = ScrollController();
  Sugerencia sugerenciaSeleccionada= Sugerencia(cliente: Cliente("",DateTime(0),DateTime(0)),comentario:"");
  TextEditingController controllerEditValor = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    ancho = MediaQuery.of(context).size.width;
    alto = MediaQuery.of(context).size.height;
    return Expanded(
        child: ListView(
          controller: scrollController,
      children: [
        const AppBarApp(titulo: "Sugerencias"),
        if(modoEditar)Container(
          padding: EdgeInsets.all(ancho > 500 ? 20 : 10),
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey.shade200,
                    offset: Offset(0, 10))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Editar sugerencia",style: fuenteSeleccionada1),
                  BotonIcon(
                    icono: Icons.close,
                    onPressed: (){
                      setState(() {
                        modoEditar = false;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: 
                Container(
                  padding: EdgeInsets.fromLTRB(10,0,10,0),
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber,
                  ),
                  child: Center(child: 
                  Text(sugerenciaSeleccionada.cliente.nombre,style: titulo,),)
                )),
                SizedBox(width: 10,),
                Expanded(
                  flex: 2,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controllerEditValor,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                          labelText: "Sugerencia"),
                      onTap: () {
                      },
                  
                    )),
                    SizedBox(width: 10,),
                BotonIconAppBar(
                    onPressed: () {
                        if (controllerEditValor.text.isNotEmpty ) {
                          setState(() {
                          sugerenciaSeleccionada.comentario = controllerEditValor.text;
                          sugerencias[sugerencias.indexWhere((element) => element == sugerenciaSeleccionada)] = sugerenciaSeleccionada;
                          sugerenciaSeleccionada = Sugerencia(cliente: Cliente("",DateTime(0),DateTime(0)),comentario:"");
                          controllerEditValor.text = "";
                          modoEditar = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Venta editada")));
                      
                        } else {
                          print("Error, no ingreso un dato");
                        }
                      },
                    icono: Icons.done_all,
                    ),
              ],
            ),
            ],
          )
        ),
        Container(
          padding: EdgeInsets.all(ancho > 500 ? 20 : 10),
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey.shade200,
                    offset: Offset(0, 10))
              ]),
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Agregar nueva sugerencia",style: fuenteSeleccionada1),
              const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: 
                DropdownButton(
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(20),
                  padding: EdgeInsets.fromLTRB(10, 17,0,0),
                      value: clienteSelect,
                      items:clientes.map((cliente) {
                        return DropdownMenuItem(
                          value: cliente,
                          child:Text(cliente.nombre)
                        );
                      }).toList(),
                      onChanged: (valor){
                        setState(() {
                          clienteSelect = valor!;
                        });
                      }
                    ),),
                    SizedBox(width: 10,),
                BotonIconAppBar(
                    onPressed: () {
                        if (controllerValor.text.isNotEmpty && clientes.isNotEmpty ) {
                              sugerencias.add(
                              Sugerencia(cliente: clienteSelect, comentario: controllerValor.text)
                              );
                              mostrarAgregar = false;
                              clienteSelect = clientes[0];
                              controllerNombre.text = "";
                              modoBusqueda = false;
                              setState(() {
                                
                              });
                            }else {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(showCloseIcon: true,content: Text("No ingreso un dato")));

                        }
                      },
                    icono: Icons.add_comment_outlined,
                    ),
              ],
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 100,
              width: ancho,
              child: TextField(
                minLines: 3,
                maxLines: 5,
                keyboardType: TextInputType.text,
                controller: controllerValor,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                    hintText: "Sugerencia"),
                onTap: () {
                },
              )
            ),
            ],
          )
        ),
        Container(
            height: 70,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                            BoxShadow(
                                blurRadius: 20,
                                color: Colors.grey.shade200,
                                offset: Offset(0, 10))
                            ],
                        ),
                        child: TextField(
                          controller: controllerBuscador,
                          decoration: const InputDecoration(
                              hintText: "Buscar por nombre",
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none),
                          onChanged: (value) {
                            setState(() {
                                    sugerenciasTemp = busquedaNombreSugerencia(controllerBuscador.text, sugerencias);
                                    modoBusqueda = true;
                                    setState(() {});
                                  });
                          },
                        ))),
                const SizedBox(
                  width: 10,
                ),
                AnimatedContainer(
                  curve: Curves.ease,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  height: 70,
                  width: controllerBuscador.text.isNotEmpty ? 140 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("   Buscando.."),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            controllerBuscador.text = "";
                            modoBusqueda = false;
                          });
                        },
                        icon: Icon(Icons.close))
                    ],
                  )
                )
              ],
            )),
        const SizedBox(
          height: 6,
        ),
        if (clientes.isNotEmpty)Container(
          padding: EdgeInsets.all(ancho > 500 ? 10 : 2),
          margin: EdgeInsets.fromLTRB(10,0, 10, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [        
            BoxShadow(
                blurRadius: 20,
                color: Colors.grey.shade200,
                offset: Offset(0, 10))
            ]
          ),
          child:
          DataTable(
              columnSpacing: 5,
              dataRowMaxHeight: 100,
              columns: [
                DataColumn(label: Text("Cliente",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Comentario",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Editar",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Remover",style: fuenteTablaTitulo,)),
              ],
              rows: modoBusqueda
                  ? sugerenciasTemp.map((sugerencia) {
                          return DataRow(
                            cells: [
                            DataCell(Text(sugerencia.cliente.nombre)),
                            DataCell((
                              SizedBox(
                                width:ancho>1000 ? ancho*0.5 : ancho*0.3,
                                child:
                                  SingleChildScrollView(
                                    child: Text(sugerencia.comentario)
                                  )
                              )
                            )),
                        DataCell(BotonIcon(
                          icono: Icons.edit,
                          onPressed: () {
                            setState(() {
                              controllerEditValor.text = sugerencia.comentario;
                              sugerenciaSeleccionada = sugerencia;
                              modoEditar = true;
                            });
                          },
                        )),
                        DataCell(BotonIcon(
                          icono: Icons.delete_outline,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Advertencia"),
                                  content:const Text.rich(
                                    TextSpan(
                                      text: "Está a punto de eliminar la sugerencia ",
                                      children: [
                                        //TextSpan(text: " \"${cliente.nombre}\" ",style: fuenteSeleccionada1),
                                        TextSpan(text: "\n¿Está seguro de proceder con la eliminación de esta sugerencia?")
                                      ]
                                    )
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancelar")
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        foregroundColor: Colors.white
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          sugerencias.removeWhere((element) => element == sugerencia);
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            showCloseIcon: true,
                                            content: Text("Venta eliminada")
                                            )
                                          );
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Eliminar")
                                    ),
                                  ],
                                );
                              },
                            );
                          
                          },
                        )),
                      ]);
                    }).toList()
                  : sugerencias.map((sugerencia) {
                          return DataRow(cells: [
                            DataCell(Text(sugerencia.cliente.nombre)),
                            DataCell((
                              SizedBox(
                                width:ancho>1000 ? ancho*0.5 : ancho*0.3,
                                child:
                                  SingleChildScrollView(
                                    child: Text(sugerencia.comentario)
                                  )
                              )
                            )),
                        DataCell(BotonIcon(
                          icono: Icons.edit,
                          onPressed: () {
                            setState(() {
                              controllerEditValor.text = sugerencia.comentario;
                              sugerenciaSeleccionada = sugerencia;
                              modoEditar = true;
                            });
                          },
                        )),
                        DataCell(BotonIcon(
                          icono: Icons.delete_outline,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Advertencia"),
                                  content: Text.rich(
                                    TextSpan(
                                      text: "Está a punto de eliminar la sugerencia ",
                                      children: [
                                        //TextSpan(text: " \"${cliente.nombre}\" ",style: fuenteSeleccionada1),
                                        TextSpan(text: "\n¿Está seguro de proceder con la eliminación de esta sugerencia?")
                                      ]
                                    )
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancelar")
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        foregroundColor: Colors.white
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          sugerencias.removeWhere((element) => element == sugerencia);
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(showCloseIcon: true,content: Text("Sugerencia eliminada")));
                                        Navigator.pop(context);
                                      },
                                      child: Text("Eliminar")
                                    ),
                                  ],
                                );
                              },
                            );
                          
                          },
                        )),
                      ]);
                    }).toList())
        )],
    ));
  }
}