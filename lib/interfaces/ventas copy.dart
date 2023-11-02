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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mostrarAgregar
        ? Expanded(
            child: Padding(padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    clientes.isNotEmpty ?
                    DropdownButton(
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
                    ):
                    BotonIcono(
                      onPressed: (){
                        vista = 1;
                        mostrarAgregar = true;
                        setState(() {});
                      },
                      texto: "Agregar cliente",
                      icono: Icons.group_add_outlined
                    ),
                    
                    TextField(
                      controller: controllerValor,
                      decoration: const InputDecoration(
                          hintText: "Valor"),
                      onTap: () {
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BotonIcono(
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
                      icono: Icons.group_add_outlined,
                      texto: "Agregar cliente"
                    ),
                    BotonIcono(
                      onPressed: (){
                        setState(() {
                          mostrarAgregar = false;
                        });
                      },
                      icono: Icons.close,
                      texto: "Cancelar"
                    )
                  ],
                )))
        : Expanded(
            child: Stack(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  const AppBarApp(
                    titulo: "Ventas"
                  ),
                  Container(
                    height: 70,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(20, 96, 125, 139)
                              ),
                              child: 
                              TextField(
                                controller: controllerBuscador,
                                decoration:const InputDecoration(
                                  hintText: "Buscar por nombre",
                                  prefixIcon: Icon(Icons.search),
                                  border: InputBorder.none
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    ventastemp = busquedaNombreVenta(controllerBuscador.text, ventas);
                                    modoBusqueda = true;
                                    setState(() {});
                                  });
                                },
                              )
                          )),
                          const SizedBox(width: 10,),
                            AnimatedContainer(
                              curve: Curves.ease,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              height: 70,
                              width: controllerBuscador.text.isNotEmpty ? 140 : 0,
                              duration: const Duration(milliseconds: 500),
                              child: const Center(child: Text("Buscando..."),)
                            )
                        ],
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  if (clientes.isNotEmpty)
                    DataTable(
                        columnSpacing: 0,
                        columns:[
                          DataColumn(label: Text("Cliente",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Valor",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Fecha de\nregistro",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Editar",style: fuenteTablaTitulo,)),
                          DataColumn(label: Text("Remover",style: fuenteTablaTitulo,)),
                        ],
                        rows: modoBusqueda ? 
                        ventastemp.map((venta) {
                          return DataRow(
                            cells: [
                            DataCell(Text(venta.cliente.nombre)),
                            DataCell(Text(venta.valor.toString())),
                            DataCell(Text( fecha(venta.fechaDePago))),
                            DataCell(
                              BotonIcon(
                                icono: Icons.edit,
                                onPressed: (){},
                              )
                            ),
                            DataCell(
                              BotonIcon(
                                icono: Icons.delete_outline,
                                onPressed: (){},
                              )
                            ),
                          ]);
                        }).toList():
                        ventas.map((venta) {
                          return DataRow(cells: [
                            DataCell(Text(venta.cliente.nombre)),
                            DataCell(Text(venta.valor.toString())),
                            DataCell(Text( fecha(venta.fechaDePago))),
                            DataCell(
                              BotonIcon(
                                icono: Icons.edit,
                                onPressed: (){},
                              )
                            ),
                            DataCell(
                              BotonIcon(
                                icono: Icons.delete_outline,
                                onPressed: (){},
                              )
                            ),
                          ]);
                        }).toList())
                ],
              )),
              Positioned(
                  bottom: 10,
                  right: 20,
                  child: FloatingActionButton(
                      backgroundColor: Colors.amber,
                      child: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          mostrarAgregar = true;
                        });
                      })),
            ],
          ));
  }
}
