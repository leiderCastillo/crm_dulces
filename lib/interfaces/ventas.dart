import 'package:crm_dulces/estilos.dart';
import 'package:crm_dulces/estructuras.dart';
import 'package:crm_dulces/funciones.dart';
import 'package:crm_dulces/interfaces/menu.dart';
import 'package:crm_dulces/interfaces/widgets.dart';
import 'package:flutter/material.dart';

class Ventas extends StatefulWidget {
  const Ventas({super.key});

  @override
  State<Ventas> createState() => _VentasState();
}

class _VentasState extends State<Ventas> {
  bool modoBusqueda = false;
  bool mostrarAgregar = false;
  TextEditingController controllerBuscador= TextEditingController();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerValor = TextEditingController();
  List<Venta> ventastemp = [];
  Cliente clienteSelect = clientes.isNotEmpty ? clientes[0] : Cliente("",DateTime(0),DateTime(0)); 

  bool modoEditar = false;
  ScrollController scrollController = ScrollController();
  Venta ventaEditSelect = Venta(clientes[0],0, DateTime(0));
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
        const AppBarApp(titulo: "Ventas"),
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
                  Text("Editar venta",style: fuenteSeleccionada1),
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
                  Text(ventaEditSelect.cliente.nombre,style: titulo,),)
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
                          labelText: "Valor"),
                      onTap: () {
                      },
                  
                    )),
                    SizedBox(width: 10,),
                BotonIconAppBar(
                    onPressed: () {
                        if (controllerEditValor.text.isNotEmpty ) {
                          setState(() {
                          ventaEditSelect.valor = parseoInt(controllerEditValor.text);
                          ventas[ventas.indexWhere((element) => element == ventaEditSelect)] = ventaEditSelect;
                          ventaEditSelect = Venta(clientes[0], 0, DateTime(0));
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Agregar nueva venta",style: fuenteSeleccionada1),
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
                Expanded(
                  flex: 2,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controllerValor,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                          hintText: "Valor"),
                      onTap: () {
                      },
                  
                    )),
                    SizedBox(width: 10,),
                BotonIconAppBar(
                    onPressed: () {
                        if (controllerValor.text.isNotEmpty ) {
                          setState(() {
                            ventas.add(
                              Venta(clienteSelect, parseoInt(controllerValor.text), DateTime.now())
                            );
                            mostrarAgregar = false;
                            clienteSelect = clientes[0];
                            controllerNombre.text = "";
                            modoBusqueda = false;
                          });
                        } else {
                          print("Error, no ingreso un dato");
                        }
                      },
                    icono: Icons.add_shopping_cart_rounded,
                    ),
              ],
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
                                    ventastemp = busquedaNombreVenta(controllerBuscador.text, ventas);
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
              columns: [
                DataColumn(label: Text("Cliente",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Valor",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Registro",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Editar",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Remover",style: fuenteTablaTitulo,)),
              ],
              rows: modoBusqueda
                  ? ventastemp.map((venta) {
                          return DataRow(
                            cells: [
                            DataCell(Text(venta.cliente.nombre)),
                            DataCell(Text(venta.valor.toString())),
                            DataCell(Text( fecha(venta.fechaDePago))),
                        DataCell(BotonIcon(
                          icono: Icons.edit,
                          onPressed: () {
                            setState(() {
                              controllerEditValor.text = venta.valor.toString();
                              ventaEditSelect = venta;
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
                                      text: "Está a punto de eliminar la venta ",
                                      children: [
                                        //TextSpan(text: " \"${cliente.nombre}\" ",style: fuenteSeleccionada1),
                                        TextSpan(text: "\n¿Está seguro de proceder con la eliminación de esta venta?")
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
                                          ventas.removeWhere((element) => element == venta);
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
                  : ventas.map((venta) {
                          return DataRow(cells: [
                            DataCell(Text(venta.cliente.nombre)),
                            DataCell(Text(venta.valor.toString())),
                            DataCell(Text( fecha(venta.fechaDePago))),
                        DataCell(BotonIcon(
                          icono: Icons.edit,
                          onPressed: () {
                            setState(() {
                              controllerEditValor.text = venta.valor.toString();
                              ventaEditSelect = venta;
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
                                      text: "Está a punto de eliminar la venta ",
                                      children: [
                                        //TextSpan(text: " \"${cliente.nombre}\" ",style: fuenteSeleccionada1),
                                        TextSpan(text: "\n¿Está seguro de proceder con la eliminación de esta venta?")
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
                                          ventas.removeWhere((element) => element == venta);
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(showCloseIcon: true,content: Text("Venta eliminada")));
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
